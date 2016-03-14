//
//  PersonalResumeViewController.m
//  DM
//
//  Created by tepusoft on 15/12/25.
//  Copyright © 2015年 tepusoft. All rights reserved.
//

#import "PersonalResumeViewController.h"
#import "NetworkInterface.h"
#import "UIViewController+Reminder.h"
#import "ResumeModel.h"
#import "OwnInfoSingleton.h"
#import "AdversInfoSingleton.h"
#import "InfoSelectViewController.h"

@interface PersonalResumeViewController ()<UITextFieldDelegate,UITextViewDelegate,InfoSelectViewControllerDelegate>
@property (weak, nonatomic) IBOutlet UIView *nameBackgroundView;
@property (weak, nonatomic) IBOutlet UIView *sexBackgroundView;
@property (weak, nonatomic) IBOutlet UIView *brithdayBackgroundView;

@property (weak, nonatomic) IBOutlet UIView *educationBackgroundView;
@property (weak, nonatomic) IBOutlet UIView *workYearBackgroundView;
@property (weak, nonatomic) IBOutlet UIView *phoneBackgroundView;
@property (weak, nonatomic) IBOutlet UIView *emailBackgroundView;
@property (weak, nonatomic) IBOutlet UIView *locationBackgroundView;
@property (weak, nonatomic) IBOutlet UIView *salaryBackgroundView;
@property (weak, nonatomic) IBOutlet UIView *positionBackgroundView;
@property (weak, nonatomic) IBOutlet UIView *secrecyBackgroundView;
@property (weak, nonatomic) IBOutlet UIView *manifestoBackgroundView;

@property (weak, nonatomic) IBOutlet UITextField *nameTextField;
@property (weak, nonatomic) IBOutlet UISegmentedControl *sexSegmentedControl;
@property (weak, nonatomic) IBOutlet UITextField *phoneTextField;
@property (weak, nonatomic) IBOutlet UITextField *emailTextField;
@property (weak, nonatomic) IBOutlet UITextField *placeTextField;
@property (weak, nonatomic) IBOutlet UITextField *positionTextField;
@property (weak, nonatomic) IBOutlet UITextView *descTextView;
@property (weak, nonatomic) IBOutlet UISwitch *publicSwitch;
@property (weak, nonatomic) IBOutlet UIButton *birthdayButton;
@property (weak, nonatomic) IBOutlet UIButton *eduButton;
@property (weak, nonatomic) IBOutlet UIButton *yearButton;
@property (weak, nonatomic) IBOutlet UIButton *salaryButton;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *scrollViewLayoutContraint;
@property (weak, nonatomic) IBOutlet UIDatePicker *birthdayDatePicker;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *birthdayBackgroundViewHeightLayoutConstraint;
@property (weak, nonatomic) IBOutlet UIView *datePickerView;

@property (nonatomic, assign) NSInteger clickButtonTag;

@end

@implementation PersonalResumeViewController



- (void)viewDidLoad {
    [super viewDidLoad];
    self.layoutContraint = _scrollViewLayoutContraint;
    
    _nameTextField.delegate = self;
    _phoneTextField.delegate = self;
    _emailTextField.delegate = self;
    _placeTextField.delegate = self;
    _descTextView.delegate = self;
    
    self.publicButton.layer.cornerRadius = 15;
    
    self.nameBackgroundView.layer.cornerRadius = 15;
    self.nameBackgroundView.layer.borderWidth = 1.0;
    self.nameBackgroundView.layer.borderColor = [UIColor colorWithRed:44/255.0 green:139/255.0 blue:224/255.0 alpha:1].CGColor;
    
    self.sexBackgroundView.layer.cornerRadius = 15;
    self.sexBackgroundView.layer.borderWidth = 1.0;
    self.sexBackgroundView.layer.borderColor = [UIColor colorWithRed:44/255.0 green:139/255.0 blue:224/255.0 alpha:1].CGColor;
    
    self.brithdayBackgroundView.layer.masksToBounds = YES;
    self.brithdayBackgroundView.layer.cornerRadius = 15;
    self.brithdayBackgroundView.layer.borderWidth = 1.0;
    self.brithdayBackgroundView.layer.borderColor = [UIColor colorWithRed:44/255.0 green:139/255.0 blue:224/255.0 alpha:1].CGColor;
    
    
    self.educationBackgroundView.layer.cornerRadius = 15;
    self.educationBackgroundView.layer.borderWidth = 1.0;
    self.educationBackgroundView.layer.borderColor = [UIColor colorWithRed:44/255.0 green:139/255.0 blue:224/255.0 alpha:1].CGColor;
    
    self.workYearBackgroundView.layer.cornerRadius = 15;
    self.workYearBackgroundView.layer.borderWidth = 1.0;
    self.workYearBackgroundView.layer.borderColor = [UIColor colorWithRed:44/255.0 green:139/255.0 blue:224/255.0 alpha:1].CGColor;
    
    self.phoneBackgroundView.layer.cornerRadius = 15;
    self.phoneBackgroundView.layer.borderWidth = 1.0;
    self.phoneBackgroundView.layer.borderColor = [UIColor colorWithRed:44/255.0 green:139/255.0 blue:224/255.0 alpha:1].CGColor;
    
    self.emailBackgroundView.layer.cornerRadius = 15;
    self.emailBackgroundView.layer.borderWidth = 1.0;
    self.emailBackgroundView.layer.borderColor = [UIColor colorWithRed:44/255.0 green:139/255.0 blue:224/255.0 alpha:1].CGColor;
    
    self.locationBackgroundView.layer.cornerRadius = 15;
    self.locationBackgroundView.layer.borderWidth = 1.0;
    self.locationBackgroundView.layer.borderColor = [UIColor colorWithRed:44/255.0 green:139/255.0 blue:224/255.0 alpha:1].CGColor;
    
    self.salaryBackgroundView.layer.cornerRadius = 15;
    self.salaryBackgroundView.layer.borderWidth = 1.0;
    self.salaryBackgroundView.layer.borderColor = [UIColor colorWithRed:44/255.0 green:139/255.0 blue:224/255.0 alpha:1].CGColor;

    self.positionBackgroundView.layer.cornerRadius = 15;
    self.positionBackgroundView.layer.borderWidth = 1.0;
    self.positionBackgroundView.layer.borderColor = [UIColor colorWithRed:44/255.0 green:139/255.0 blue:224/255.0 alpha:1].CGColor;
    
    self.secrecyBackgroundView.layer.cornerRadius = 15;
    self.secrecyBackgroundView.layer.borderWidth = 1.0;
    self.secrecyBackgroundView.layer.borderColor = [UIColor colorWithRed:44/255.0 green:139/255.0 blue:224/255.0 alpha:1].CGColor;
    
    self.manifestoBackgroundView.layer.cornerRadius = 15;
    self.manifestoBackgroundView.layer.borderWidth = 1.0;
    self.manifestoBackgroundView.layer.borderColor = [UIColor colorWithRed:44/255.0 green:139/255.0 blue:224/255.0 alpha:1].CGColor;
    
    // Do any additional setup after loading the view.
}

- (IBAction)birthdayButtonClick:(id)sender {
    [UIView animateWithDuration:0.5 animations:^{
        self.birthdayBackgroundViewHeightLayoutConstraint.constant = 200;
        [self.view layoutIfNeeded];
        _datePickerView.hidden = NO;
    }];
    _birthdayDatePicker.layer.frame = CGRectMake(0, 0, _brithdayBackgroundView.frame.size.width, 130);
}
- (IBAction)eduButtonClick:(UIButton *)sender {
    _clickButtonTag = sender.tag;
    [self jumpSelectVeiwController:@"学历"];
}
- (IBAction)workYearButtonClick:(UIButton *)sender {
    _clickButtonTag = sender.tag;
    [self jumpSelectVeiwController:@"工作年限"];
}
- (IBAction)salaryButtonClick:(UIButton *)sender {
    _clickButtonTag = sender.tag;
    [self jumpSelectVeiwController:@"薪资"];
}
- (IBAction)scrollViewClick:(id)sender {
    [self.view endEditing:YES];
}
- (IBAction)dataPickerCancelButtonClick:(id)sender {
    self.birthdayDatePicker.layer.frame = CGRectMake(0, 40, self.brithdayBackgroundView.frame.size.width, 0);
    [UIView animateWithDuration:0.5 animations:^{
        self.birthdayBackgroundViewHeightLayoutConstraint.constant = 40;
        _datePickerView.hidden = YES;
        [self.view layoutIfNeeded];
    }];
}
- (IBAction)dataPickerSureButtonClick:(id)sender {
    NSDateFormatter *formatter= [[NSDateFormatter alloc]init];
    [formatter setDateFormat:@"yyyy-MM-dd"];
    
    [UIView animateWithDuration:0.5 animations:^{
        self.birthdayBackgroundViewHeightLayoutConstraint.constant = 40;
        _datePickerView.hidden = YES;
        [self.view layoutIfNeeded];
    }];
    [_birthdayButton setTitle:[formatter stringFromDate:_birthdayDatePicker.date] forState:UIControlStateNormal];
}
- (IBAction)publicButtonClick:(id)sender {
    if ([self importFull]) {
        ResumeModel *resumeModel = [[ResumeModel alloc]init];
        resumeModel.userId = [OwnInfoSingleton sharedManager].Id?:@"";
        resumeModel.companyId = [AdversInfoSingleton shareManager].adversModel.Id?:@"";
        resumeModel.name = _nameTextField.text;
        resumeModel.sex = _sexSegmentedControl.selectedSegmentIndex==0?@"0":@"1";
        resumeModel.birthday = _birthdayButton.titleLabel.text;
        resumeModel.edu = _eduButton.titleLabel.text;
        resumeModel.year = _yearButton.titleLabel.text;
        resumeModel.phone = _phoneTextField.text;
        resumeModel.email = _emailTextField.text;
        resumeModel.workarea = _placeTextField.text;
        resumeModel.worksalary = _salaryButton.titleLabel.text;
        resumeModel.workPosition = _positionTextField.text;
        resumeModel.isPublic = _publicSwitch.on?@"1":@"0";
        resumeModel.jobDesc = _descTextView.text;
        [NetworkInterface commitJianliWithResumeModel:resumeModel
                                         successBlock:^(NetworkInterfaceReturnDataModel *returnDataModel) {
                                             
                                         }
                                         failureBlock:^{
                                             
                                         } ];
    }
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
    if ([_nameTextField.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]].length == 0) {
        [self showAnimationTitle:@"输入姓名"];
        return NO;
    }else if ([_birthdayButton.titleLabel.text isEqualToString:@"未设置"]){
        [self showAnimationTitle:@"未设置生日"];
        return NO;
    }else if ([_eduButton.titleLabel.text isEqualToString:@"未设置"]){
        [self showAnimationTitle:@"未设置学历"];
        return NO;
    }else if ([_yearButton.titleLabel.text isEqualToString:@"未设置"]){
        [self showAnimationTitle:@"未设置工作年限"];
        return NO;
    }else if ([_phoneTextField.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]].length == 0) {
        [self showAnimationTitle:@"输入电话"];
        return NO;
    }else if ([_emailTextField.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]].length == 0) {
        [self showAnimationTitle:@"输入邮箱"];
        return NO;
    }else if ([_placeTextField.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]].length == 0) {
        [self showAnimationTitle:@"输入期望区域"];
        return NO;
    }else if ([_salaryButton.titleLabel.text isEqualToString:@"未设置"]){
        [self showAnimationTitle:@"设置期望工资"];
        return NO;
    }else if ([_positionTextField.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]].length == 0) {
        [self showAnimationTitle:@"输入期望职位"];
        return NO;
    }else{
        return YES;
    }
}
#pragma mark -  UITextFieldDelegate
-(void)textFieldDidBeginEditing:(UITextField *)textField
{
    self.selectControl = textField;
}

-(void)textViewDidBeginEditing:(UITextView *)textView
{
    self.selectControl = textView;
}


#pragma mark -  InfoSelectViewControllerDelegate
-(void)infoSelectViewControllerDidSelectWithTitle:(NSString *)title
{
    UIButton *button = [self.view viewWithTag:_clickButtonTag];
    if ([button isKindOfClass:[UIButton class]]) {
        [button setTitle:title forState:UIControlStateNormal];
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
