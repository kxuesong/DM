//
//  RecruitInfoViewController.m
//  DM
//
//  Created by tepusoft on 16/1/7.
//  Copyright © 2016年 tepusoft. All rights reserved.
//

#import "RecruitInfoViewController.h"
#import "InfoSelectViewController.h"
#import "UIViewController+Reminder.h"
#import "ChannelModel.h"
#import "AreaSelectViewController.h"
#import "NetworkInterface.h"
#import "PullTimeInfoModel.h"
#import "OwnInfoSingleton.h"
@interface RecruitInfoViewController ()<UITextFieldDelegate,UITextViewDelegate,InfoSelectViewControllerDelegate,AreaSelectViewControllerDelegate>


@property (weak, nonatomic) IBOutlet NSLayoutConstraint *scrollViewLowLayoutContraint;
@property (nonatomic, assign) NSInteger clickButtonTag;

@property (weak, nonatomic) IBOutlet UIView *titleBackgroundView;
@property (weak, nonatomic) IBOutlet UIView *positionBackgroundView;
@property (weak, nonatomic) IBOutlet UIView *eduBackgroundView;
@property (weak, nonatomic) IBOutlet UIView *salaryBackgroundView;
@property (weak, nonatomic) IBOutlet UIView *yearBackgroundView;
@property (weak, nonatomic) IBOutlet UIView *peopleNumberBackgroundView;
@property (weak, nonatomic) IBOutlet UIView *ageBackgroundView;
@property (weak, nonatomic) IBOutlet UIView *areaBackgroundView;
@property (weak, nonatomic) IBOutlet UIView *companyNameBackgroundView;
@property (weak, nonatomic) IBOutlet UIView *placeBackgroundView;
@property (weak, nonatomic) IBOutlet UIView *desBackgroundView;
@property (weak, nonatomic) IBOutlet UIView *contactPersonBackgroundView;
@property (weak, nonatomic) IBOutlet UIView *phoneBackgroundView;
@property (weak, nonatomic) IBOutlet UIView *publicTypeBackgroundView;


@property (weak, nonatomic) IBOutlet UITextField *titleTextField;
@property (weak, nonatomic) IBOutlet UIButton *positionButton;
@property (weak, nonatomic) IBOutlet UIButton *yearButton;
@property (weak, nonatomic) IBOutlet UIButton *salaryButton;
@property (weak, nonatomic) IBOutlet UIButton *eduButton;
@property (weak, nonatomic) IBOutlet UITextField *peopleNumberTextField;
@property (weak, nonatomic) IBOutlet UITextField *minAgeTextField;
@property (weak, nonatomic) IBOutlet UITextField *maxAgeTextField;
@property (weak, nonatomic) IBOutlet UIButton *placeButtom;
@property (weak, nonatomic) IBOutlet UITextField *companyNameTextField;
@property (weak, nonatomic) IBOutlet UITextView *disTextView;
@property (weak, nonatomic) IBOutlet UITextField *placeTextField;
@property (weak, nonatomic) IBOutlet UITextField *contactPersonTextField;
@property (weak, nonatomic) IBOutlet UISwitch *offLinePublicSwitch;
@property (weak, nonatomic) IBOutlet UIButton *publicButtom;
@property (weak, nonatomic) IBOutlet UITextField *phoneTextField;
@end

@implementation RecruitInfoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.layoutContraint = self.scrollViewLowLayoutContraint;
    
    self.titleBackgroundView.layer.cornerRadius = 15;
    self.titleBackgroundView.layer.borderWidth = 1.0;
    self.titleBackgroundView.layer.borderColor = [UIColor colorWithRed:44/255.0 green:139/255.0 blue:224/255.0 alpha:1].CGColor;
    
    
    self.positionBackgroundView.layer.cornerRadius = 15;
    self.positionBackgroundView.layer.borderWidth = 1.0;
    self.positionBackgroundView.layer.borderColor = [UIColor colorWithRed:44/255.0 green:139/255.0 blue:224/255.0 alpha:1].CGColor;
    
    
    self.eduBackgroundView.layer.cornerRadius = 15;
    self.eduBackgroundView.layer.borderWidth = 1.0;
    self.eduBackgroundView.layer.borderColor = [UIColor colorWithRed:44/255.0 green:139/255.0 blue:224/255.0 alpha:1].CGColor;
    
    
    self.salaryBackgroundView.layer.cornerRadius = 15;
    self.salaryBackgroundView.layer.borderWidth = 1.0;
    self.salaryBackgroundView.layer.borderColor = [UIColor colorWithRed:44/255.0 green:139/255.0 blue:224/255.0 alpha:1].CGColor;
    
    
    self.yearBackgroundView.layer.cornerRadius = 15;
    self.yearBackgroundView.layer.borderWidth = 1.0;
    self.yearBackgroundView.layer.borderColor = [UIColor colorWithRed:44/255.0 green:139/255.0 blue:224/255.0 alpha:1].CGColor;
    
    
    self.peopleNumberBackgroundView.layer.cornerRadius = 15;
    self.peopleNumberBackgroundView.layer.borderWidth = 1.0;
    self.peopleNumberBackgroundView.layer.borderColor = [UIColor colorWithRed:44/255.0 green:139/255.0 blue:224/255.0 alpha:1].CGColor;
    
    
    self.ageBackgroundView.layer.cornerRadius = 15;
    self.ageBackgroundView.layer.borderWidth = 1.0;
    self.ageBackgroundView.layer.borderColor = [UIColor colorWithRed:44/255.0 green:139/255.0 blue:224/255.0 alpha:1].CGColor;
    
    
    self.areaBackgroundView.layer.cornerRadius = 15;
    self.areaBackgroundView.layer.borderWidth = 1.0;
    self.areaBackgroundView.layer.borderColor = [UIColor colorWithRed:44/255.0 green:139/255.0 blue:224/255.0 alpha:1].CGColor;
    
    
    self.companyNameBackgroundView.layer.cornerRadius = 15;
    self.companyNameBackgroundView.layer.borderWidth = 1.0;
    self.companyNameBackgroundView.layer.borderColor = [UIColor colorWithRed:44/255.0 green:139/255.0 blue:224/255.0 alpha:1].CGColor;
    
    
    self.placeBackgroundView.layer.cornerRadius = 15;
    self.placeBackgroundView.layer.borderWidth = 1.0;
    self.placeBackgroundView.layer.borderColor = [UIColor colorWithRed:44/255.0 green:139/255.0 blue:224/255.0 alpha:1].CGColor;
    
    
    self.desBackgroundView.layer.cornerRadius = 15;
    self.desBackgroundView.layer.borderWidth = 1.0;
    self.desBackgroundView.layer.borderColor = [UIColor colorWithRed:44/255.0 green:139/255.0 blue:224/255.0 alpha:1].CGColor;
    
    
    self.contactPersonBackgroundView.layer.cornerRadius = 15;
    self.contactPersonBackgroundView.layer.borderWidth = 1.0;
    self.contactPersonBackgroundView.layer.borderColor = [UIColor colorWithRed:44/255.0 green:139/255.0 blue:224/255.0 alpha:1].CGColor;
    
    
    self.phoneBackgroundView.layer.cornerRadius = 15;
    self.phoneBackgroundView.layer.borderWidth = 1.0;
    self.phoneBackgroundView.layer.borderColor = [UIColor colorWithRed:44/255.0 green:139/255.0 blue:224/255.0 alpha:1].CGColor;
    
    
    self.publicTypeBackgroundView.layer.cornerRadius = 15;
    self.publicTypeBackgroundView.layer.borderWidth = 1.0;
    self.publicTypeBackgroundView.layer.borderColor = [UIColor colorWithRed:44/255.0 green:139/255.0 blue:224/255.0 alpha:1].CGColor;
    self.publicButtom.layer.cornerRadius = 15;
    

    self.titleTextField.delegate = self;
    self.peopleNumberTextField.delegate = self;
    self.minAgeTextField.delegate = self;
    self.maxAgeTextField.delegate = self;
    self.companyNameTextField.delegate = self;
    self.contactPersonTextField.delegate = self;
    self.phoneTextField.delegate = self;
    // Do any additional setup after loading the view.
    
    self.title = _chanelModel.name;
}




//工作职位
- (IBAction)positionButtonClick:(UIButton *)sender {
    _clickButtonTag = sender.tag;
    InfoSelectViewController *vc = (InfoSelectViewController *)[self storyboardWithstoryboardID:@"InfoSelectViewController"];
    vc.findType = [NSString stringWithFormat:@"%ld",(long)_chanelModel.Id];
    vc.isWorkPosition = YES;
    vc.delegate =self;
    [self.navigationController pushViewController:vc animated:YES];
}
//工作年限
- (IBAction)yearButtonClick:(UIButton *)sender {
    _clickButtonTag = sender.tag;
    [self jumpSelectVeiwController:@"工作年限"];
}
//薪资待遇
- (IBAction)salaryButtonClick:(UIButton *)sender {
    _clickButtonTag = sender.tag;
    [self jumpSelectVeiwController:@"薪资"];
}
//学历要求
- (IBAction)eduButtonClick:(UIButton *)sender {
    _clickButtonTag = sender.tag;
    [self jumpSelectVeiwController:@"学历"];
}
//所属区域
- (IBAction)areaButtonClick:(UIButton *)sender {
    _clickButtonTag = sender.tag;
    AreaSelectViewController *areaSelectVC = [[AreaSelectViewController alloc]initWithNibName:@"AreaSelectViewController" bundle:nil];
    areaSelectVC.delegate =self;
    [self.navigationController pushViewController:areaSelectVC animated:YES];
}

- (IBAction)publicButtonClick:(id)sender {
    if([self importFull]){
        PullTimeInfoModel *model = [[PullTimeInfoModel alloc]init];
        model.Id = @"";
        model.userId = [OwnInfoSingleton sharedManager].Id?:@"";
        model.companyId =[OwnInfoSingleton sharedManager].companyid?:@"";
        model.companyName = @"";
        model.areaId = @"";
        model.areaName = @"";
        model.rootId = @(_chanelModel.rootid).stringValue;
        model.parentids = @(_chanelModel.pid).stringValue;
        model.channelid = @(_chanelModel.Id).stringValue;
        model.channelName = _chanelModel.name;
        NSDateFormatter *formatter = [[NSDateFormatter alloc]init];
        [formatter setDateFormat:@"YYYY-MM-dd HH:mm:ss"];
        model.releaseTime = [formatter stringFromDate:[NSDate date]];
        model.gongsi = _companyNameTextField.text;
        model.title = _titleTextField.text;
        model.desc = _disTextView.text;
        model.personName = _contactPersonTextField.text;
        model.personPhone = _phoneTextField.text;
        model.imageURL = @"";
        model.infotype = @"";
        model.year = _yearButton.titleLabel.text;
        model.salary = _salaryButton.titleLabel.text;
        model.edu = _eduButton.titleLabel.text;
        model.num = _peopleNumberTextField.text;
        model.age = [NSString stringWithFormat:@"%@-%@",_minAgeTextField.text,_maxAgeTextField.text];
        model.place = _placeTextField.text;
        [NetworkInterface commitReleaseonlineWithOnLinePublic:model
                                                 successBlock:^(NetworkInterfaceReturnDataModel *returnDataModel) {
                                                     if(returnDataModel.status == 0){
                                                         NSLog(@"%@",returnDataModel.data);
                                                     }else{
                                                         [self showAnimationTitle:@"请求错误"];
                                                     }
                                                 }
                                                 failureBlock:^{
                                                     [self showAnimationTitle:@"网络错误"];
                                                 }];
    }
}
- (IBAction)scrollViewClick:(id)sender {
    [self.view endEditing:YES];
}


#pragma mark -  CoustomFunction

-(void)jumpSelectVeiwController:(NSString *)type
{
    InfoSelectViewController *vc = (InfoSelectViewController *)[self storyboardWithstoryboardID:@"InfoSelectViewController"];
    vc.findType = type;
    vc.delegate = self;
    [self.navigationController pushViewController:vc animated:YES];
}

-(BOOL)importFull
{
    if ([_peopleNumberTextField.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]].length == 0) {
        [self showAnimationTitle:@"未填写招聘人数"];
        return NO;
    }else if([_titleTextField.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]].length == 0){
        [self showAnimationTitle:@"未填写标题"];
        return NO;
    }else if([_minAgeTextField.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]].length == 0){
        [self showAnimationTitle:@"未填写最小年龄"];
        return NO;
    }else if([_maxAgeTextField.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]].length == 0){
        [self showAnimationTitle:@"未填写最大年龄"];
        return NO;
    }else if ([_companyNameTextField.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]].length == 0){
        [self showAnimationTitle:@"未填写公司名称"];
        return NO;
    }else if([_placeTextField.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]].length == 0){
        [self showAnimationTitle:@"未填写工作地点"];
        return NO;
    }else if ([_disTextView.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]].length == 0){
        [self showAnimationTitle:@"未填写职位描述"];
        return NO;
    }else if ([_phoneTextField.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]].length == 0){
        [self showAnimationTitle:@"未填写联系电话"];
        return NO;
    }else if ([_contactPersonTextField.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]].length == 0){
        [self showAnimationTitle:@"未填写联系人"];
        return NO;
    }else if ([_positionButton.titleLabel.text isEqualToString:@"未设定"]){
        [self showAnimationTitle:@"未设置工作职位"];
        return NO;
    }else if ([_yearButton.titleLabel.text isEqualToString:@"未设定"]){
        [self showAnimationTitle:@"未设置工作年限"];
        return NO;
    }else if ([_eduButton.titleLabel.text isEqualToString:@"未设定"]){
        [self showAnimationTitle:@"未设置学历要求"];
        return NO;
    }else if ([_placeButtom.titleLabel.text isEqualToString:@"未设定"]){
        [self showAnimationTitle:@"未设置所属地区"];
        return NO;
    }else{
        return YES;
    }
}

#pragma mark -  UITextFieldDelegate
-(void)textFieldDidBeginEditing:(UITextField *)textField
{
    super.selectControl = textField;
}


-(void)textViewDidBeginEditing:(UITextView *)textView
{
    super.selectControl = textView;
}

#pragma mark -  InfoSelectViewControllerDelegate
-(void)infoSelectViewControllerDidSelectWithTitle:(NSString *)title
{
    UIButton *button = [self.view viewWithTag:_clickButtonTag];
    if ([button isKindOfClass:[UIButton class]]) {
        [button setTitle:title forState:UIControlStateNormal];
    }
}

#pragma mark -  AreaSelectViewControllerDelegate
-(void)AreaSelectViewControllerFinishSelectWithArea:(NSString *)area
{
    UIButton *button = [self.view viewWithTag:_clickButtonTag];
    if ([button isKindOfClass:[UIButton class]]) {
        [button setTitle:area forState:UIControlStateNormal];
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
