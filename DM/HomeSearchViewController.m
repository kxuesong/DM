//
//  HomeSearchViewController.m
//  DM
//
//  Created by tepusoft on 16/1/5.
//  Copyright © 2016年 tepusoft. All rights reserved.
//

#import "HomeSearchViewController.h"
#import "AreaListTableViewCell.h"
#import "MJRefresh.h"
#import "NetworkInterface.h"

@interface HomeSearchViewController ()<UITableViewDataSource,UITableViewDelegate>
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *sortViewHeightLayoutConstraint;

@property (nonatomic, strong) NSArray *sortTableArray;
@property (nonatomic, strong) NSArray *listTableArray;


@end

@implementation HomeSearchViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _sortTableView.delegate = self;
    _sortTableView.dataSource = self;
    _sortTableView.tableFooterView = [[UIView alloc]init];
    
    _listTableView.delegate = self;
    _listTableView.dataSource = self;
    _listTableView.tableFooterView = [[UIView alloc]init];
    
    _sortTableArray = @[@"发布时间",@"信息标题",@"用户等级"];
    _listTableArray =@[];
    
    _listTableView.mj_header = [MJRefreshHeader headerWithRefreshingBlock:^{
        
        
    }];
    _listTableView.mj_footer = [MJRefreshFooter footerWithRefreshingBlock:^{
        
    }];
    
    
    // Do any additional setup after loading the view.
}
- (IBAction)sortButtonClick:(UIButton *)sender {
    if (sender.tag == 0) {
        sender.tag = 1;
        [UIView animateWithDuration:0.5 animations:^{
            _sortViewHeightLayoutConstraint.constant = 120;
            [self.view layoutIfNeeded];
            _sortImageView.transform = CGAffineTransformMakeRotation(M_PI);
        }];
        
    }else{
        sender.tag = 0;
        [UIView animateWithDuration:0.5 animations:^{
            _sortViewHeightLayoutConstraint.constant = 0;
            _sortImageView.transform = CGAffineTransformMakeRotation(0);
            [self.view layoutIfNeeded];
            
        }];
    }
}



#pragma mark - UITableVIewDelegate AND UITableViewDataSourch
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (tableView.tag == 1) {//sortTableView
        return _sortTableArray.count;
    }else{
        return _listTableArray.count;
    }
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (tableView.tag == 1) {
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

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
