//
//  MyViewController.m
//  DM
//
//  Created by tepusoft on 15/12/22.
//  Copyright © 2015年 tepusoft. All rights reserved.
//

#import "MyViewController.h"
#import "MyViewControllerTableViewCell.h"
#import "OwnInfoSingleton.h"
#import "H5ViewController.h"
#import "NetworkInterface.h"
#import "UIViewController+Reminder.h"
#import "OwnInfoSingleton.h"


@interface MyViewController ()<UITableViewDataSource,UITableViewDelegate,UIAlertViewDelegate>

@property (nonatomic, strong) NSArray *tableImageArray;
@property (nonatomic, strong) NSArray *tableTitleArray;

@end

@implementation MyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableImageArray = @[@[@"my_tableViewCell_public",@"my_tableViewCell_message"],@[@"my_tableViewCell_resume",@"my_tableViewCell_setting"]];
    self.tableTitleArray = @[@[@"我的发布",@"我的留言"],@[@"个人简历",@"设置中心"]];
    
    
    // Do any additional setup after loading the view.
}

-(void)viewWillAppear:(BOOL)animated
{
    if ([OwnInfoSingleton sharedManager].Id==NULL) {
        self.LoginInfoView.hidden = YES;
        self.LoginButton.hidden = NO;
    }else{
        self.LoginButton.hidden = YES;
        self.LoginInfoView.hidden = NO;
        self.nickNameLabel.text = [OwnInfoSingleton sharedManager].nickname;
        self.levelLabel.text = [OwnInfoSingleton sharedManager].usertype;
    }
}

#pragma mark - Button Click

// sign button touch up inside （签到）

- (IBAction)signButtonClick:(id)sender {
    [NetworkInterface customerSigninWithCustomerid:[OwnInfoSingleton sharedManager].Id?: @""
                                      successBlock:^(NetworkInterfaceReturnDataModel *returnDataModel) {
                                          if (returnDataModel.status == 0) {
                                              [self showAnimationTitle:@"签到成功"];
                                          }else{
                                              [self showAnimationTitle:returnDataModel.message];
                                          }
                                      }
                                      failureBlock:^{
                                          [self showAnimationTitle:@"网络错误"];
                                      }];
    
}

// public button touch up inside （发布）
- (IBAction)publicButtonClick:(id)sender {
    
    UIAlertView *alertView = [[UIAlertView alloc]initWithTitle:@"发布类型" message:nil delegate:self cancelButtonTitle:nil otherButtonTitles:@"线下发布",@"线上发布",nil];
    alertView.tag = 1;
    [alertView show];
    
}

// integral button touch up inside （积分）
- (IBAction)integralButtonClick:(id)sender {
    UIStoryboard *sb = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    H5ViewController *h5VC = [sb instantiateViewControllerWithIdentifier:@"H5ViewController"];
    h5VC.enterType = EnterTypeFraction;
    h5VC.title = @"积分";
    [self.navigationController pushViewController:h5VC animated:YES];
}

// login button touch up inside (登录)
- (IBAction)loginButtonClick:(id)sender {
    
}

// registered button touch up inside (注册)
- (IBAction)registeredButtonClick:(id)sender {
    
}


#pragma mark - CoustomFunction



#pragma mark - UITableViewDelegate and UITableViewDataSource
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 2;
}


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    MyViewControllerTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"MyViewControllerTableViewCell"];
    if (cell == nil) {
        cell = [[NSBundle mainBundle] loadNibNamed:@"MyViewControllerTableViewCell" owner:nil options:nil][0];
        cell.headImageView.image = [UIImage imageNamed:self.tableImageArray[indexPath.section][indexPath.row]];
        cell.nameLabel.text = self.tableTitleArray[indexPath.section][indexPath.row];
    }
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 40;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    if (section == 0) {
        return 0;
    }else{
        return 10;
    }
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *identifier ;
    if(indexPath.section == 0&& indexPath.row == 0){
        identifier = @"MyPublicViewController";
        
    }else if (indexPath.section == 0 && indexPath.row == 1){
        identifier = @"SettingViewController";
    }else if (indexPath.section ==1&& indexPath.row == 0){
        identifier = @"PersonalResumeViewController";
    }else if (indexPath.section == 1 && indexPath.row == 1){
        identifier = @"SettingViewController";
    }
    UIStoryboard *sb = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    UIViewController *vc = [sb instantiateViewControllerWithIdentifier:identifier];
    [self.navigationController pushViewController:vc animated:YES];
}

#pragma  mark - UIAlertViewDelegate
-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (alertView.tag == 1) {//发布类型
        if (buttonIndex == 0) {
            UIStoryboard *sb = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
            UIViewController *vc = [sb instantiateViewControllerWithIdentifier:@"BelowLinePublicViewController"];
            [self.navigationController pushViewController:vc animated:YES];
        }
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
