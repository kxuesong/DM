//
//  ListInfoViewController.m
//  DM
//
//  Created by tepusoft on 16/1/10.
//  Copyright © 2016年 tepusoft. All rights reserved.
//

#import "ListInfoViewController.h"
#import "NetworkInterface.h"
#import "UIViewController+Reminder.h"
#import "AdversInfoSingleton.h"
#import "ScheduleModel.h"
#import "ColumnModel.h"

@interface ListInfoViewController ()<UITableViewDataSource,UITableViewDelegate>

@property (nonatomic, strong) NSArray *tableArray;


@end

@implementation ListInfoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _tableView.delegate =self;
    _tableView.dataSource = self;
    _tableView.tableFooterView = [[UITableView alloc]init];
    
    [self initWithTableArray];
}


-(void)initWithTableArray
{
    if (_enterType == ScheduleType) {
        [NetworkInterface getlistScheduleWithCompanyId:[AdversInfoSingleton shareManager].adversModel.Id?:@""
                                          successBlock:^(NetworkInterfaceReturnDataModel *returnDataModel) {
                                              if (returnDataModel.status == 0) {
                                                  NSMutableArray *mutableArray = [NSMutableArray array];
                                                  for (NSDictionary *dic in returnDataModel.data) {
                                                      ScheduleModel *model = [[ScheduleModel alloc]initWithDictionary:dic];
                                                      [mutableArray addObject:model];
                                                  }
                                                  _tableArray = mutableArray;
                                                  [_tableView reloadData];
                                              }else{
                                                  [self showAnimationTitle:returnDataModel.message];
                                              }
                                          }
                                          failureBlock:^{
                                              [self showAnimationTitle:@"网络错误"];
                                          }];
    }else if (_enterType == ColumnsType){
        [NetworkInterface getColumnsByCompanyIdWithColumnId:@(_tableView.tag).stringValue
                                                  companyId:[AdversInfoSingleton shareManager].adversModel.Id?:@""
                                                     typeId:@"0"
                                               successBlock:^(NetworkInterfaceReturnDataModel *returnDataModel) {
                                                   if(returnDataModel.status == 0){
                                                       NSMutableArray *mutableArray = [NSMutableArray array];
                                                       for (NSDictionary *dic in returnDataModel.data) {
                                                           ColumnModel *model = [[ColumnModel alloc]initWithDictionary:dic];
                                                           [mutableArray addObject:model];
                                                       }
                                                       _tableArray = mutableArray;
                                                       [_tableView reloadData];
                                                       
                                                   }else{
                                                       [self showAnimationTitle:returnDataModel.message];
                                                   }
                                               }
                                               failureBlock:^{
                                                   [self showAnimationTitle:@"网络错误"];
                                               }];
    }
    
}

#pragma mark - UITableViewDelegate AND UITableViewDataSource
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _tableArray.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ListInfoViewControllerTableCell"];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"ListInfoViewControllerTableCell"];
    }
    if (_enterType == ScheduleType) {
        ScheduleModel *model = _tableArray[indexPath.row];
        cell.textLabel.text = [NSString stringWithFormat:@"%@ (第%@期)",model.releasetime,model.yearperiods];
    }else if(_enterType == ColumnsType){
        ColumnModel *model = _tableArray[indexPath.row];
        cell.textLabel.text = model.name;
    }
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (_enterType == ScheduleType) {
        [self.delegate listInfoTableViewDidSelected:_tableArray[indexPath.row]];
        [self.navigationController popViewControllerAnimated:YES];
    }else if (_enterType == ColumnsType){
        if (_tableView.tag != 0) {
            [self.delegate listInfoTableViewDidSelected:_tableArray[indexPath.row]];
            [self.navigationController popViewControllerAnimated:YES];
        }else{
            ColumnModel *model = _tableArray[indexPath.row];
            _tableView.tag = model.Id.intValue;
            [self initWithTableArray];
        }
    }
}

@end
