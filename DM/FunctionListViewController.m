//
//  FunctionListViewController.m
//  DM
//
//  Created by tepusoft on 16/1/3.
//  Copyright © 2016年 tepusoft. All rights reserved.
//

#import "FunctionListViewController.h"
#import "FunctionListTableViewCell.h"
#import "MJRefresh.h"
#import "NetworkInterface.h"
#import "UIViewController+Reminder.h"
#import "AdversInfoSingleton.h"
#import "RecruitmentAdversModel.h"

@interface FunctionListViewController ()<UITableViewDataSource,UITableViewDelegate>
@property (nonatomic, strong) NSArray *tableArray;
@property (nonatomic, assign) NSInteger page;
@end

@implementation FunctionListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.tableFooterView = [[UIView alloc]init];
    
    self.tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        _page = 1;
        [NetworkInterface getAdverlistBycolumnidWithCompanyId:[AdversInfoSingleton shareManager].adversModel.Id
                                                       rootId:_rootId
                                                    channelid:_channelId
                                                   paramField:@""
                                                   paramValue:@""
                                                      orderBy:@""
                                                         page:[NSString stringWithFormat:@"%ld",(long)_page]
                                                         rows:@"10"
                                                 successBlock:^(NetworkInterfaceReturnDataModel *returnDataModel) {
                                                     [self.tableView.mj_header endRefreshing];
                                                     NSArray *listArray = [returnDataModel.data objectForKey:@"list"];
                                                     NSMutableArray *mutableArray = [NSMutableArray array];
                                                     for (NSDictionary *dic in listArray) {
                                                         RecruitmentAdversModel *model = [[RecruitmentAdversModel alloc]initWithDictionary:dic];
                                                         [mutableArray addObject:model];
                                                     }
                                                     _tableArray = mutableArray;
                                                     [self.tableView reloadData];
                                                    
                                                 } failureBlock:^{
                                                     [self showAnimationTitle:@"网络获取失败"];
//                                                     [self.tableView.mj_header endEditing:YES];
                                                 }];
    }];
    self.tableView.mj_footer = [MJRefreshAutoFooter footerWithRefreshingBlock:^{
        [NetworkInterface getAdverlistBycolumnidWithCompanyId:[AdversInfoSingleton shareManager].adversModel.Id
                                                       rootId:_rootId
                                                    channelid:_channelId
                                                   paramField:@""
                                                   paramValue:@""
                                                      orderBy:@""
                                                         page:[NSString stringWithFormat:@"%ld",(long)_page]
                                                         rows:@"10"
                                                 successBlock:^(NetworkInterfaceReturnDataModel *returnDataModel) {
                                                     [self.tableView.mj_footer endRefreshing];
                                                 } failureBlock:^{
                                                     [self showAnimationTitle:@"网络获取失败"];
                                                 }];
    }];
    
    [_tableView.mj_header beginRefreshing];
    // Do any additional setup after loading the view.
}

#pragma mark -UITableViewDelegate AND UITableViewDataSource

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.tableArray.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    FunctionListTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"FunctionListTableViewCell"];
    if (cell == nil) {
        cell = [[NSBundle mainBundle] loadNibNamed:@"FunctionListTableViewCell" owner:nil options:nil][0];
    }
    RecruitmentAdversModel *model = _tableArray[indexPath.row];
    cell.timeLabel.text = model.releaseTime;
    cell.titleLabel.text = model.title;
    cell.smallLabel.text = model.desc;
    return cell;
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
