//
//  AdvertisersListViewController.m
//  DM
//
//  Created by tepusoft on 16/1/3.
//  Copyright © 2016年 tepusoft. All rights reserved.
//

#import "AdvertisersListViewController.h"
#import "AreaModel.h"
#import "UIViewController+Reminder.h"
#import "SqliteOperateQueue.h"
#import "DMLocalSqliteData.h"
#import "NetworkInterface.h"
#import "AreaListTableViewCell.h"
#import "NetworkInterfaceReturnDataModel.h"
#import "AdversModel.h"
#import "AdversInfoSingleton.h"


@interface AdvertisersListViewController ()<UITableViewDataSource,UITableViewDelegate>

@property (nonatomic, strong) AreaModel *provinceAreaModel;
@property (nonatomic, strong) AreaModel *cityAreaModel;
@property (nonatomic, strong) AreaModel *districtAreaModel;


@property (nonatomic, strong) NSArray *tableArray;

@property (nonatomic, assign) NSInteger clickTag;


@end

@implementation AdvertisersListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    _tableView.tableFooterView = [[UIView alloc]init];
    
}
- (IBAction)provinceButtonClick:(id)sender {
    _clickTag = 100;
    [self showTableView];
}


-(IBAction)cityButtonClick:(UIButton *)sender
{
    if (self.provinceAreaModel == nil) {
        [self showAnimationTitle:@"请选择省份"];
        return;
    }
    _clickTag = 101;
    [self showTableView];
}

-(IBAction)districtButtonClick:(UIButton *)sender
{
    if (self.cityAreaModel == nil) {
        [self showAnimationTitle:@"请选择市"];
        return;
    }
    _clickTag = 102;
    [self showTableView];
}


-(void)showTableView
{
    CGFloat with = 250;
    CGFloat hight = 350;
    CGSize viewSize = self.view.frame.size;
    
    UIView *bottomView = [[UIView alloc]initWithFrame:self.view.frame];
    bottomView.backgroundColor = [UIColor colorWithRed:29/255.0 green:29/255.0 blue:29/255.0 alpha:0.8];
    bottomView.tag = 300;
    [self.view addSubview:bottomView];
    UIView *backgroundView = [[UIView alloc]initWithFrame:CGRectMake((viewSize.width-with)/2, (viewSize.height-hight)/2, with, hight)];
    backgroundView.backgroundColor =  [UIColor colorWithRed:48.0/255.0 green:126.0/255.0 blue:218.0/255.0 alpha:1];
    backgroundView.layer.cornerRadius = 5.0;
    backgroundView.layer.masksToBounds = YES;
    backgroundView.tag = 200;
    [self.view addSubview:backgroundView];
    
    UIButton *cancelButton = [[UIButton alloc]initWithFrame:CGRectMake(0, 300, with, 50)];
    [cancelButton setTitle:@"取消" forState:UIControlStateNormal];
    [cancelButton addTarget:self action:@selector(tableCancel:) forControlEvents:UIControlEventTouchUpInside];
    [backgroundView addSubview:cancelButton];
    
    
    UITableView *tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, with, hight-50)];
    //    tableView.layer.cornerRadius = 10.0;
    tableView.tableFooterView = [[UIView alloc]init];
    tableView.tag = 99;
    tableView.delegate = self;
    tableView.dataSource = self;
    [backgroundView addSubview:tableView];
    tableView.alpha = 0;
    [UIView animateWithDuration:0.5 animations:^{
        tableView.alpha = 1;
    }];
    [self initTableArray];
    
}
-(void)tableCancel:(UIButton *)sender
{
    UIView *view = [self.view viewWithTag:200];
    [view removeFromSuperview];
    UIView *bottom = [self.view viewWithTag:300];
    [bottom removeFromSuperview];
}
-(void)initTableArray
{
    dispatch_async([SqliteOperateQueue shareManager], ^{
        if (self.clickTag == 100) {
            self.tableArray = [DMLocalSqliteData provinceListData];
        }else if(self.clickTag == 101){
            self.tableArray = [DMLocalSqliteData cityListDataWithProvinceCode:self.provinceAreaModel.code];
        }else if(self.clickTag == 102){
            NSMutableArray *mutableArray =[DMLocalSqliteData districtListDataWithCityCode:self.cityAreaModel.code];
            AreaModel *areaModel = [[AreaModel alloc]init];
            areaModel.code = self.cityAreaModel.code;
            areaModel.name = @"全部";
            [mutableArray insertObject:areaModel atIndex:0];
            self.tableArray = mutableArray;
        }
        
        dispatch_async(dispatch_get_main_queue(), ^{
            UITableView *tableView = [self.view viewWithTag:99];
            [tableView reloadData];
        });
    });
}
#pragma mark - UITableViewDelegate and UITableViewDataSource
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.tableArray.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (tableView.tag == 99) {
        AreaListTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"AreaListTableViewCell"];
        if (cell == nil) {
            cell = [[NSBundle mainBundle]loadNibNamed:@"AreaListTableViewCell" owner:nil options:nil][0];
        }
        AreaModel *areaModel = self.tableArray[indexPath.row];
        cell.titleLabel.text =areaModel.name;
        return cell;
    }else{
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"AdvertisersSelectTableCell"];
        if (cell == nil) {
            cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"AdvertisersSelectTableCell"];
        }
        AdversModel *adversModel = self.tableArray[indexPath.row];
        cell.textLabel.text =adversModel.name;
        return cell;
    }
    
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (tableView.tag ==99) {
        AreaModel *areaModel = self.tableArray[indexPath.row];
        if (self.clickTag == 100) {
            self.provinceAreaModel = areaModel;
        }else if(self.clickTag == 101){
            self.cityAreaModel = areaModel;
        }else if(self.clickTag == 102){
            self.districtAreaModel = areaModel;
            
            
            [NetworkInterface getAdversWithCode:areaModel.code
                                   successBlock:^(NetworkInterfaceReturnDataModel *returnDataModel) {
                                       if (returnDataModel.status == 0) {
                                           if (returnDataModel.data &&((NSArray *)returnDataModel.data).count>0) {
                                               NSMutableArray *adversArray = [NSMutableArray array];
                                               for (NSDictionary *dic in returnDataModel.data) {
                                                   AdversModel *adverModel = [[AdversModel alloc]initWithDictionary:dic];
                                                   [adversArray addObject:adverModel];
                                               }
                                               _tableArray = adversArray;
                                               [_tableView reloadData];
                                           }else{
                                               [self showAnimationTitle:@"无数据"];
                                           }
                                       }
                                   } failureBlock:^{
                                       [self showAnimationTitle:@"网络请求失败"];
                                   }];
            
            
        }
        UIButton *button = [self.view viewWithTag:self.clickTag];
        [button setTitle:areaModel.name forState:UIControlStateNormal];
        self.tableArray = [NSArray new];
        [self tableCancel:nil];
    }else{
        AdversModel *adversModel = _tableArray[indexPath.row];
        NSData *data = [NSKeyedArchiver archivedDataWithRootObject:adversModel];
        NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
        [defaults setObject:data forKey:@"MyAdver"];
        [AdversInfoSingleton initWithAdversModel:adversModel];
        [_delegate didSelectAdvertisers:adversModel];
        [self.navigationController popViewControllerAnimated:YES];
    }
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
