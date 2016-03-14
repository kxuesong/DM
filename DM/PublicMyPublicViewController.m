//
//  PublicMyPublicViewController.m
//  DM
//
//  Created by tepusoft on 16/1/5.
//  Copyright © 2016年 tepusoft. All rights reserved.
//

#import "PublicMyPublicViewController.h"
#import "AreaListTableViewCell.h"
#import "MJRefresh.h"
#import "NetworkInterface.h"
#import "OwnInfoSingleton.h"


@interface PublicMyPublicViewController ()<UITableViewDataSource,UITableViewDelegate>

@property (nonatomic, strong) NSArray *sortTableArray;
@property (nonatomic, strong) NSArray *listTableArray;
@property (weak, nonatomic) IBOutlet UIButton *kindButton;

@property (nonatomic, assign) NSInteger page;

@property (weak, nonatomic) IBOutlet UIButton *sortButton;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *sortTableViewHeightLayoutConstraint;

@end

@implementation PublicMyPublicViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _sortTableView.delegate = self;
    _sortTableView.dataSource =self;
    _sortTableView.tableFooterView = [[UIView alloc]init];
    
    _listTableView.delegate = self;
    _listTableView.dataSource =self;
    _listTableView.tableFooterView = [[UIView alloc]init];
    
    _sortTableArray = @[@"线上信息",@"线下信息"];
    
    _listTableView.mj_header = [MJRefreshHeader headerWithRefreshingBlock:^{
        
    }];
    
//    _listTableView.mj_header = [MJRefreshHeader headerWithRefreshingTarget:self refreshingAction:@selector(upPullToUpdata)];

}

- (IBAction)kindButtonClick:(UIButton *)sender {
    
    _sortTableArray = @[@"线上信息",@"线下信息"];
    [_sortTableView reloadData];
    if (sender.tag == 0) {
        sender.tag = 1;
        if (_sortButton.tag == 1) {
            _sortButton.tag = 0;
        }
        [UIView animateWithDuration:0.5 animations:^{
            _sortImageView.transform = CGAffineTransformMakeRotation(0);
            _kindImageView.transform = CGAffineTransformMakeRotation(M_PI);
            _sortTableViewHeightLayoutConstraint.constant = 80;
            [self.view layoutIfNeeded];
        }];
    }else{
        sender.tag = 0;

        [UIView animateWithDuration:0.5 animations:^{
            _kindImageView.transform = CGAffineTransformMakeRotation(0);
            _sortTableViewHeightLayoutConstraint.constant = 0;
            [self.view layoutIfNeeded];
        }];
    }
    
}
- (IBAction)sortButtonClick:(UIButton *)sender {
    _sortTableArray = @[@"时间排序",@"等级排序"];
    [_sortTableView reloadData];
    if (sender.tag == 0) {
        sender.tag = 1;
        if (_kindButton.tag == 1) {
            _kindButton.tag = 0;
        }
        [UIView animateWithDuration:0.5 animations:^{
            _kindImageView.transform = CGAffineTransformMakeRotation(0);
            _sortImageView.transform = CGAffineTransformMakeRotation(M_PI);
            _sortTableViewHeightLayoutConstraint.constant = 80;
            [self.view layoutIfNeeded];
        }];
        
    }else{
        sender.tag = 0;
        
        [UIView animateWithDuration:0.5 animations:^{
            _sortImageView.transform = CGAffineTransformMakeRotation(0);
            _sortTableViewHeightLayoutConstraint.constant = 0;
            [self.view layoutIfNeeded];
        }];
    }
}

#pragma mark -  CoustomFunction
-(void)upPullToUpdata
{
    
//    [NetworkInterface getMyhistoryListOnlineWithUserId:[OwnInfoSingleton sharedManager].Id
//                                            paramfield:@""
//                                            paramValue:@""
//                                               orderby:@""
//                                                  page:@(_page).stringValue
//                                                  rows:@"10"
//                                          successBlock:^(NetworkInterfaceReturnDataModel *returnDataModel) {
//                                              
//                                          }
//                                          failureBlock:^{
//                                              
//                                          }];
}

#pragma mark - UITableViewDelegate AND UITableViewDataSource
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (tableView.tag == 0) {
        return _sortTableArray.count;
    }
    return _listTableArray.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (tableView.tag == 0) {
        AreaListTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"AreaListTableViewCell"];
        if (cell == nil) {
            cell = [[NSBundle mainBundle]loadNibNamed:@"AreaListTableViewCell" owner:nil options:nil][0];
        }
        cell.titleLabel.text =_sortTableArray[indexPath.row];
        return cell;
    }else{
        AreaListTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"AreaListTableViewCell"];
        if (cell == nil) {
            cell = [[NSBundle mainBundle]loadNibNamed:@"AreaListTableViewCell" owner:nil options:nil][0];
        }
        cell.titleLabel.text =_sortTableArray[indexPath.row];
        return cell;
    }
    
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (tableView.tag == 0) {
        _kindButton.tag = 0;
        _sortButton.tag = 0;
        [UIView animateWithDuration:0.5 animations:^{
            _sortImageView.transform = CGAffineTransformMakeRotation(0);
            _kindImageView.transform = CGAffineTransformMakeRotation(0);
            _sortTableViewHeightLayoutConstraint.constant = 0;
            
        }];
    }
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 40;
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
