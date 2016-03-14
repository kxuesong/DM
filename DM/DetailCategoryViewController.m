//
//  DetailCategoryViewController.m
//  DM
//
//  Created by tepusoft on 16/1/5.
//  Copyright © 2016年 tepusoft. All rights reserved.
//

#import "DetailCategoryViewController.h"
#import "DetailCategoryTableViewCell.h"
#import "ChannelModel.h"
#import "SqliteOperateQueue.h"
#import "DMLocalSqliteData.h"
#import "RecruitInfoViewController.h"

@interface DetailCategoryViewController ()<UITableViewDelegate,UITableViewDataSource>

//@property (nonatomic, strong) NSArray *tableArray;

@end

@implementation DetailCategoryViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _tableView.delegate =self;
    _tableView.dataSource = self;
    _tableView.tableFooterView = [[UIView alloc]init];
    [self initTableArray];
}

#pragma mark -  CoustomFunction
-(void)initTableArray
{
    dispatch_async([SqliteOperateQueue shareManager], ^{
        NSArray *array = [DMLocalSqliteData sonCategoryListDataWithParentId:_parentId];
        _tableArray = array;
        dispatch_async(dispatch_get_main_queue(), ^{
            [_tableView reloadData];
        });
    });
}

#pragma mark - UITableViewDelegate AND UITableViewDataSource
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _tableArray.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    DetailCategoryTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"DetailCategoryTableViewCell"];
    if (cell == nil) {
        cell = [[NSBundle mainBundle]loadNibNamed:@"DetailCategoryTableViewCell" owner:nil options:nil][0];
    }
    ChannelModel *model = _tableArray[indexPath.row];
    cell.nameLabel.text = model.name;
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    UIStoryboard *sb = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    RecruitInfoViewController *vc = [sb instantiateViewControllerWithIdentifier:@"RecruitInfoViewController"];
    vc.chanelModel = _tableArray[indexPath.row];
    [self.navigationController pushViewController:vc animated:YES];
    return;
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
