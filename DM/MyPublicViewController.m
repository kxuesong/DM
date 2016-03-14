//
//  MyPublicViewController.m
//  DM
//
//  Created by tepusoft on 15/12/26.
//  Copyright © 2015年 tepusoft. All rights reserved.
//

#import "MyPublicViewController.h"
#import "MJRefresh.h"
#import "NetworkInterface.h"
#import "UIViewController+Reminder.h"
#import "OwnInfoSingleton.h"
#import "OffLinePublicModel.h"
#import "FunctionListTableViewCell.h"

typedef enum : NSUInteger {
    NetworkingTypeOffLinePublic,
    NetworkingTypeOnLinePublic
} NetWorkingType;

@interface MyPublicViewController ()<UITableViewDataSource,UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic, strong) NSArray *tableArray;
@property (nonatomic, assign) NetWorkingType netWorkingType;
@property (nonatomic ,assign) NSInteger page;

@end

@implementation MyPublicViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.tableFooterView =[[UIView alloc]init];
    
    _netWorkingType = NetworkingTypeOffLinePublic;
    
    self.tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(upPullToUpdate)];
    self.tableView.mj_footer = [MJRefreshAutoFooter footerWithRefreshingTarget:self refreshingAction:@selector(upPullToUpdate)];
    
    [_tableView.mj_header beginRefreshing];
}

- (IBAction)offLinePublicButtonClick:(UIButton *)sender {
    if (sender.tag ==1) {
        return;
    }else{
        sender.tag = 1;
        _netWorkingType = NetworkingTypeOffLinePublic;
    }
}
- (IBAction)onLinePublicButtonClick:(UIButton *)sender {
    if (sender.tag ==1) {
        return;
    }else{
        sender.tag = 1;
        _netWorkingType = NetworkingTypeOffLinePublic;
    }
}
- (IBAction)sortButtomClick:(id)sender {
}


-(void)upPullToUpdate
{
    _page = 1;
    [NetworkInterface getMyhistoryListOfflineWithUserId:[OwnInfoSingleton sharedManager].Id?:@""
                                             paramfield:@""
                                             paramValue:@""
                                                orderby:@""
                                                   page:@(_page).stringValue
                                                   rows:@"10"
                                           successBlock:^(NetworkInterfaceReturnDataModel *returnDataModel) {
                                               if(returnDataModel.status == 0){
                                                   NSArray *array = [returnDataModel.data objectForKey:@"list"];
                                                   NSMutableArray *mutableArray = [[NSMutableArray alloc]init];
                                                   for (NSDictionary *dic in array) {
                                                       OffLinePublicModel *model = [[OffLinePublicModel alloc]initWithDictionary:dic];
                                                       [mutableArray addObject:model];
                                                   }
                                                   _tableArray = mutableArray;
                                                   [_tableView reloadData];
                                               }else{
                                                   [self showAnimationTitle:@"数据错误"];
                                               }
                                               [_tableView.mj_header endRefreshing];
                                           }
                                           failureBlock:^{
                                               [self showAnimationTitle:@"网络错误"];
                                               [_tableView.mj_header endRefreshing];
                                           }];
    
}


#pragma mark - UITableViewDelegate AND UITableViewDataSource
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _tableArray.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    FunctionListTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"FunctionListTableViewCell"];
    if (cell == nil) {
        cell = [[NSBundle mainBundle]loadNibNamed:@"FunctionListTableViewCell" owner:nil options:nil][0];
    }
    OffLinePublicModel *model = _tableArray[indexPath.row];
    cell.titleLabel.text =model.title;
    cell.smallLabel.text = model.desc;
    cell.timeLabel.text = model.releasetime;
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 72;
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
