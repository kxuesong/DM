//
//  SettingViewController.m
//  DM
//
//  Created by tepusoft on 15/12/25.
//  Copyright © 2015年 tepusoft. All rights reserved.
//

#import "SettingViewController.h"


@interface SettingViewController ()<UITableViewDataSource,UITableViewDelegate>

@property (nonatomic, strong)NSArray *tableArray;

@end

@implementation SettingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tableArray = @[@[@"意见反馈"],@[@"新手帮助",@"关于我们",@"客服电话"]];
    
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.tableFooterView = [[UIView alloc] init];

}

#pragma mark - UITableViewDelegate and UITableViewDataSource

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return ((NSArray *)self.tableArray[section]).count;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return self.tableArray.count;
}


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"SettingVCTableCell"];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"SettingVCTableCell"];
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }
    cell.textLabel.text = self.tableArray[indexPath.section][indexPath.row];
    return cell;
}


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *identifier;
    if (indexPath.section== 0&&indexPath.row == 0) {//意见反馈
        identifier = @"AdviseFeedbackViewController";
    }else if(indexPath.section == 1 &&indexPath.row == 0){//新手帮助
        identifier = @"AboutWeViewController";
    }else if(indexPath.section == 1 && indexPath.row == 1){//关于我们
        identifier = @"AboutWeViewController";
    }else if(indexPath.section == 1 && indexPath.row == 2){// 客服电话
        identifier = @"ServerPhoneViewController";
    }
    UIStoryboard *sb = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    UIViewController *vc = [sb instantiateViewControllerWithIdentifier:identifier];
    [self.navigationController pushViewController:vc animated:YES];
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    if (section == 1) {
        return 20;
    }
    return 0;
}

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView *view = [[UIView alloc]init];
    view.alpha = 0;
    return view;
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
