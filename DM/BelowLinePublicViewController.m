//
//  BelowLinePublicViewController.m
//  DM
//
//  Created by tepusoft on 15/12/26.
//  Copyright © 2015年 tepusoft. All rights reserved.
//

#import "BelowLinePublicViewController.h"
#import "NetworkInterface.h"
#import "NetworkInterfaceReturnDataModel.h"
#import "BelowLinePublicTableViewCell.h"
#import "MJRefresh.h"
#import "UIViewController+Reminder.h"
#import "OwnInfoSingleton.h"
#import "AdversInfoSingleton.h"
#import "PickinfoModel.h"


@interface BelowLinePublicViewController ()<UITableViewDataSource,UITableViewDelegate,BelowLinePublicTableViewCellDeleagete>

@property (nonatomic, strong) NSArray *tableArray;

@property (nonatomic ,assign) NSInteger page;

@property (nonatomic, strong) NSMutableArray *selectedArray;

@end

@implementation BelowLinePublicViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.acquireInfoButton.layer.cornerRadius = 5.0;
    
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.tableFooterView = [[UIView alloc]init];
    
    
    self.tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(pullDownUpdate)];
    
    _selectedArray = [NSMutableArray array];
    
    [_tableView.mj_header beginRefreshing];
    
    // Do any additional setup after loading the view.
}

#pragma mark -CoustomFunction
-(void)pullDownUpdate
{
    _page = 1;
    [NetworkInterface getPickInfoListWithUserId:[OwnInfoSingleton sharedManager].Id?:@""
                                      companyId:[AdversInfoSingleton shareManager].adversModel.Id
                                     paramfield:@""
                                     paramValue:@""
                                        orderby:@""
                                           page:@(_page).stringValue
                                           rows:@"10"
                                   successBlock:^(NetworkInterfaceReturnDataModel *returnDataModel) {
                                       if (returnDataModel.status == 0) {
                                           NSLog(@"%@",returnDataModel.data);
                                           NSMutableArray *mutableArray = [NSMutableArray array]
                                           ;
                                           for (NSDictionary *dic  in [returnDataModel.data objectForKey:@"list"]) {
                                               PickinfoModel *model = [[PickinfoModel alloc]initWithDictionary:dic];
                                               [mutableArray addObject:model];
                                           }
                                           _tableArray = mutableArray;
                                           
                                           [_tableView reloadData];
                                           [_tableView.mj_header endRefreshing];
                                       }else{
                                           [self showAnimationTitle:@"请求失败"];
                                       }
                                   }
                                   failureBlock:^{
                                       [self showAnimationTitle:@"网络错误"];
                                   }];
}

#pragma mark - UITableViewDelegate AND UITableViewDataSource


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _tableArray.count;
}


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    BelowLinePublicTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"BelowLinePublicTableViewCell"];
    if(cell == nil ){
        cell = [[NSBundle mainBundle]loadNibNamed:@"BelowLinePublicTableViewCell" owner:nil options:nil][0];
    }
    PickinfoModel *model = _tableArray[indexPath.row];
    cell.titleLabel.text = model.title;
    cell.smallTitleLabel.text = model.desc;
    cell.timeLabel.text = model.releasetime;
    cell.tag = indexPath.row;
    cell.delegate =self;
    if ([_selectedArray containsObject:@(indexPath.row)]) {
        [cell.selectedButton setSelected:YES];
    }
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 58;
}



#pragma mark -  BelowLinePublicViewController

-(void)didClickButtonWithTag:(NSInteger)tag
{
    if ([_selectedArray containsObject:@(tag)]) {
        [_selectedArray removeObject:@(tag)];
    }else{
        [_selectedArray addObject:@(tag)];
    }
}

@end
