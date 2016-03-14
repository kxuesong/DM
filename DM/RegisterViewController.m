//
//  RegisterViewController.m
//  DynamicSChool
//
//  Created by 小屁孩 on 15/8/21.
//  Copyright (c) 2015年 XS. All rights reserved.
//

#import "RegisterViewController.h"
#import "UIViewController+Reminder.h"
#import "NetworkInterface.h"
#import "UIViewController+Reminder.h"
#import "AdvertisersListViewController.h"
#import "AdversInfoSingleton.h"
//#import "BaseNetWorking.h"

@interface RegisterViewController ()<UIScrollViewDelegate,AdvertisersListViewControllerDelegate>
{
    UITextField *selectTextField;
    NSTimer *timer;
    NSInteger second;
}
@property (weak, nonatomic) IBOutlet UIView *confireTextFieldView;
@property (weak, nonatomic) IBOutlet UIView *pwdTextFieldView;
@property (weak, nonatomic) IBOutlet UIView *verificationCodeTextFieldView;
@property (weak, nonatomic) IBOutlet UIView *phoneTextFieldView;
@property (weak, nonatomic) IBOutlet UIView *selectAdvertView;
@property (weak, nonatomic) IBOutlet UIView *emailTextFieldView;
@property (weak, nonatomic) IBOutlet UIView *inviteTextFieldView;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *scrollViewLowLayoutConstraint;

@property (nonatomic, strong) AdversModel *adversModel;

@end

@implementation RegisterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //设置圆角
    _confireTextFieldView.layer.cornerRadius = 5.0;
    _confireTextFieldView.layer.borderWidth = 1.0;
    _confireTextFieldView.layer.borderColor = [UIColor colorWithRed:164/255.0 green:164/255.0 blue:164/255.0 alpha:1].CGColor;
    _pwdTextFieldView.layer.cornerRadius = 5.0;
    _pwdTextFieldView.layer.borderWidth = 1.0;
    _pwdTextFieldView.layer.borderColor = [UIColor colorWithRed:164/255.0 green:164/255.0 blue:164/255.0 alpha:1].CGColor;
    _confireTextFieldView.layer.cornerRadius = 5.0;
    _selectAdvertView.layer.cornerRadius = 5.0;
    _selectAdvertView.layer.borderColor = [UIColor colorWithRed:164/255.0 green:164/255.0 blue:164/255.0 alpha:1].CGColor;
    _selectAdvertView.layer.borderWidth = 1.0;
    _emailTextFieldView.layer.borderColor = [UIColor colorWithRed:164/255.0 green:164/255.0 blue:164/255.0 alpha:1].CGColor;
    _emailTextFieldView.layer.cornerRadius = 5.0;
    _emailTextFieldView.layer.borderWidth = 1.0;
    _inviteTextFieldView.layer.cornerRadius = 5.0;
    _inviteTextFieldView.layer.borderColor = [UIColor colorWithRed:164/255.0 green:164/255.0 blue:164/255.0 alpha:1].CGColor;
    _inviteTextFieldView.layer.borderWidth = 1.0;
    
    _verificationCodeTextFieldView.layer.cornerRadius = 5.0;
    _verificationCodeTextFieldView.layer.borderWidth = 1.0;
     _verificationCodeTextFieldView.layer.borderColor = [UIColor colorWithRed:164/255.0 green:164/255.0 blue:164/255.0 alpha:1].CGColor;
    _phoneTextFieldView.layer.cornerRadius = 5.0;
    _phoneTextFieldView.layer.borderWidth = 1.0;
    _phoneTextFieldView.layer.borderColor = [UIColor colorWithRed:164/255.0 green:164/255.0 blue:164/255.0 alpha:1].CGColor;

    _finishButton.layer.cornerRadius = 5.0;
    
    _sendButton.layer.cornerRadius = 5.0;
    
    
    //设置TextField代理
    _phoneNumberTextField.delegate =self;
    _verificationCodeTextField.delegate =self;
    _pwdTextField.delegate =self;
    _confirmPwdTextField.delegate = self;
    
    
   
}

- (IBAction)tapGestureScrollView:(id)sender {
    [self.view endEditing:YES];
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"RegisterViewControllerToAdvertisersListViewController"]) {
        AdvertisersListViewController *vc = segue.destinationViewController;
        vc.delegate = self;
    }
}


#pragma mark - UITextField 代理方法
- (void)textFieldDidBeginEditing:(UITextField *)textField
{
    selectTextField = textField;
}


//发送验证码
- (IBAction)sendClick:(id)sender {
    if (_phoneNumberTextField.text.length!=11) {
        [self showAnimationTitle:@"请正确填写手机号"];
    }else if(!_adversModel){
        [self showAnimationTitle:@"请选择广告商"];
    }else{

        [self.sendButton setEnabled:NO];
        [self.sendButton setBackgroundColor:[UIColor grayColor]];
        
        [NetworkInterface commitKeycodeWithCodeType:@"0"
                                                tel:_phoneNumberTextField.text
                                          companyid:_adversModel.Id
                                       successBlock:^(NetworkInterfaceReturnDataModel *returnDataModel) {
                                           if (returnDataModel.status == 0) {
                                               timer = [NSTimer timerWithTimeInterval:1.0 target:self selector:@selector(timerResponseSelect) userInfo:nil repeats:YES];
                                               [[NSRunLoop currentRunLoop] addTimer:timer forMode:NSDefaultRunLoopMode];
                                               second = 59;
                                           }else{
                                               [self showAnimationTitle:@"发送失败"];
                                           }
                                       }
                                       failureBlock:^{
                                           [self showAnimationTitle:@"网络问题"];
                                       }];
    }
}
-(void)timerResponseSelect
{
    second --;
    NSString *string = [NSString stringWithFormat:@"%lds重新发送",(long)second];
    [self.sendButton setTitle:string forState:UIControlStateDisabled];
    if (second == 0) {
        [timer invalidate];
        [self.sendButton setEnabled:YES];
        [self.sendButton setTitle:@"发送" forState:UIControlStateDisabled];
        self.sendButton.backgroundColor = [UIColor colorWithRed:44/255.0 green:139/255.0 blue:224/255.0 alpha:1];
    }
    
}
- (IBAction)finishClick:(id)sender {
    if (!_adversModel) {
        [self showAnimationTitle:@"请选择广告商"];
    }else if(_phoneNumberTextField.text.length == 0||_verificationCodeTextField.text.length==0||_pwdTextField.text.length==0||_confirmPwdTextField.text.length == 0||_emailTextField.text.length == 0){
        [self showAnimationTitle:@"请填写完整"];
    }else if (_phoneNumberTextField.text.length != 11){
        [self showAnimationTitle:@"手机号码位数不正确"];
    }else if (![_pwdTextField.text isEqualToString:_confirmPwdTextField.text]){
        [self showAnimationTitle:@"两次密码不一致"];
    }else{
        [NetworkInterface commitRegistWithCompanyId:_adversModel.Id
                                                tel:_phoneNumberTextField.text
                                            keyCode:_verificationCodeTextField.text
                                           password:_pwdTextField.text
                                              email:_emailTextField.text
                                           nickName:_phoneNumberTextField.text
                                                 no:_inviteTextField.text
                                       successBlock:^(NetworkInterfaceReturnDataModel *returnDataModel) {
                                           if(returnDataModel.status == 0)
                                           {
                                               [self showAnimationTitle:@"注册成功"];
                                               [self.navigationController popViewControllerAnimated:YES];
                                           }
                                       }
                                       failureBlock:^{
                                           [self showAnimationTitle:@"网络问题"];
                                       }];
    }
    
}

#pragma mark - 自定义方法
// 键盘通知
- (void)keyboardWillShowNotification:(NSNotification *)info
{
    NSDictionary *userInfo = [info userInfo];
    CGSize kbSize = [[userInfo objectForKey:UIKeyboardFrameEndUserInfoKey] CGRectValue].size;
    UIView *surper = [selectTextField superview];
    CGFloat x=(surper.frame.origin.y + surper.frame.size.height)-(self.view.frame.size.height-kbSize.height);
    _scrollViewLowLayoutConstraint.constant = kbSize.height-49;
    
    if (x>0) {
        CGRect frame = self.view.frame;
        frame.origin.y = frame.origin.y -x;
        [UIView animateWithDuration:0.5 animations:^{
            self.view.frame = frame;
        }];
        self.view.tag = 1;
    }
}
- (void)keyboardWillHideNotification:(NSNotification *)info
{
    _scrollViewLowLayoutConstraint.constant = 0;
    if (self.view.tag == 1) {
        
        CGRect frame = self.view.frame;
        frame.origin.y = 0;
        [UIView animateWithDuration:0.5 animations:^{
            self.view.frame = frame;
        }];
    }
}


//验证验证码
- (void)checkValidCodeNotifiction:(NSNotification *)notifiction{
    
    [[NSNotificationCenter defaultCenter] removeObserver:self name:@"checkValidCode" object:nil];
    NSString *tag = notifiction.object;
    if ([tag isEqualToString:@"1"]) {
//        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(selector) name:@"userReg" object:nil];
//        BaseNetWorking *bnw = [[BaseNetWorking alloc]init];
//        [bnw webserviceRequestWithMetch:@"userReg " parameter:@{@"arg0":self.phoneNumberTextField.text,@"arg1":self.pwdTextField.text}];
        return;
    }
    [self stopNetWorking];
    if ([tag isEqualToString:@"0"]){
        [self showAnimationTitle:@"验证码错误"];
    }else if([tag isEqualToString:@"-1"]){
        [self showAnimationTitle:@"验证码超时"];
    }else if ([tag isEqualToString:@"-2"]){
        [self showAnimationTitle:@"验证码异常"];
    }
}

#pragma mark - UIAdvertiseresListDelegate
-(void)didSelectAdvertisers:(AdversModel *)adversModel
{
    _adversModel = adversModel;
    [_adversButton setTitle:adversModel.name forState:UIControlStateNormal];
}


@end
