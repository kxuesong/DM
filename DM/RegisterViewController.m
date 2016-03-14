//
//  RegisterViewController.m
//  DynamicSChool
//
//  Created by 小屁孩 on 15/8/21.
//  Copyright (c) 2015年 XS. All rights reserved.
//

#import "RegisterViewController.h"
#import "UIViewController+Reminder.h"
#import "BaseNetWorking.h"

@interface RegisterViewController ()
{
    UITextField *selectTextField;
    NSTimer *timer;
    NSInteger second;
}
@property (weak, nonatomic) IBOutlet UIView *confireTextFieldView;
@property (weak, nonatomic) IBOutlet UIView *pwdTextFieldView;
@property (weak, nonatomic) IBOutlet UIView *verificationCodeTextFieldView;
@property (weak, nonatomic) IBOutlet UIView *phoneTextFieldView;


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
    
    
    //键盘通知
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(keyboardWillShowNotification:) name:UIKeyboardWillShowNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillHideNotification:) name:UIKeyboardWillHideNotification object:nil];
}


#pragma mark - UITextField 代理方法
- (void)textFieldDidBeginEditing:(UITextField *)textField
{
    selectTextField = textField;
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self.view endEditing:YES];
}
//发送验证码
- (IBAction)sendClick:(id)sender {
    if (_phoneNumberTextField.text.length!=11) {
        [self showAnimationTitle:@"请正确填写手机号"];
    }else
    {
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(sendValidCodeNotification:) name:@"sendValidCode" object:nil];
        BaseNetWorking *bnw = [[BaseNetWorking alloc]init];
        [bnw webserviceRequestWithMetch:@"sendValidCode" parameter:@{@"arg0":self.phoneNumberTextField.text,@"arg1":@"1"}];
        [self.sendButton setEnabled:NO];
        [self.sendButton setBackgroundColor:[UIColor grayColor]];
        timer = [NSTimer timerWithTimeInterval:1.0 target:self selector:@selector(timerResponseSelect) userInfo:nil repeats:YES];
        [[NSRunLoop currentRunLoop] addTimer:timer forMode:NSDefaultRunLoopMode];
        second = 59;
//        dispatch_queue_t queue =dispatch_queue_create("com.gcd.RegisterViewControllerSerialQueue", NULL);
//        dispatch_apply(60, queue, ^(size_t index) {
//            NSLog(@"%zu",index);
//            dispatch_time_t popTime= dispatch_time(DISPATCH_TIME_NOW, ((double)index)*NSEC_PER_SEC);
//            dispatch_after(popTime, queue, ^{
//                dispatch_async(dispatch_get_main_queue(), ^{
//                    NSString *string = [NSString stringWithFormat:@"%zu秒后发送",59-index];
//                    [self.sendButton setTitle:string forState:UIControlStateDisabled];
//                    if (index == 59) {
//                        [self.sendButton setEnabled:YES];
//                        [self.sendButton setTitle:@"发送" forState:UIControlStateDisabled];
//                        self.sendButton.backgroundColor = [UIColor orangeColor];
//                    }
//                });
//            });
//        });
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
        self.sendButton.backgroundColor = [UIColor orangeColor];
    }
    
}
- (IBAction)finishClick:(id)sender {
    if(_phoneNumberTextField.text.length == 0||_verificationCodeTextField.text.length==0||_pwdTextField.text.length==0||_confirmPwdTextField.text.length == 0){
        [self showAnimationTitle:@"请填写完整"];
    }else if (_phoneNumberTextField.text.length != 11){
        [self showAnimationTitle:@"手机号码位数不正确"];
    }else if (![_pwdTextField.text isEqualToString:_confirmPwdTextField.text]){
        [self showAnimationTitle:@"两次密码不一致"];
    }else{
        //验证验证码
        [self starNetWorking];
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(checkValidCodeNotifiction:) name:@"checkValidCode" object:nil];
        BaseNetWorking *bnw = [[BaseNetWorking alloc]init];
        [bnw webserviceRequestWithMetch:@"checkValidCode" parameter:@{@"arg0":self.verificationCodeTextField.text,@"arg1":self.phoneNumberTextField.text}];
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
    NSLog(@"%f,%f",(surper.frame.origin.y + surper.frame.size.height),(self.view.frame.size.height-kbSize.height));
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
    if (self.view.tag == 1) {
        CGRect frame = self.view.frame;
        frame.origin.y = 0;
        [UIView animateWithDuration:0.5 animations:^{
            self.view.frame = frame;
        }];
    }
}
//通知事件
//发送验证码通知
-(void)sendValidCodeNotification:(NSNotification *)notification
{
    [[NSNotificationCenter defaultCenter] removeObserver:self name:@"sendValidCode" object:nil];
}

//验证验证码
- (void)checkValidCodeNotifiction:(NSNotification *)notifiction{
    
    [[NSNotificationCenter defaultCenter] removeObserver:self name:@"checkValidCode" object:nil];
    NSString *tag = notifiction.object;
    if ([tag isEqualToString:@"1"]) {
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(selector) name:@"userReg" object:nil];
        BaseNetWorking *bnw = [[BaseNetWorking alloc]init];
        [bnw webserviceRequestWithMetch:@"userReg " parameter:@{@"arg0":self.phoneNumberTextField.text,@"arg1":self.pwdTextField.text}];
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
//发送注册通知事件
- (void)userRegNotification:(NSNotification *)notification
{
    [self stopNetWorking];
    NSString *tag = notification.object;
    if (tag == nil) {
        [self showAnimationTitle:@"注册失败"];
    }else if([tag isEqualToString:@"-1"]){
        [self showAnimationTitle:@"手机号已经注册"];
    }else{
        [self showAnimationTitle:@"注册成功"];
    }
    [[NSNotificationCenter defaultCenter] removeObserver:self name:@"userReg" object:nil];
}

@end
