//
//  LoginViewController.m
//  DynamicSChool
//
//  Created by 小屁孩 on 15/8/21.
//  Copyright (c) 2015年 XS. All rights reserved.
//

#import "LoginViewController.h"
#import "UIViewController+Reminder.h"
#import "AppDelegate.h"
#import "NetworkInterface.h"
#import "OwnInfoSingleton.h"
#import "NetworkInterfaceReturnDataModel.h"

@interface LoginViewController ()<UIScrollViewDelegate>
{
    UITextField *selectTextField;
}
@property (weak, nonatomic) IBOutlet UIView *userNameTextFieldView;

@property (weak, nonatomic) IBOutlet UIView *pwdTextFieldView;


@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _headImageView.layer.cornerRadius = 45.0;
    _headImageView.layer.masksToBounds = YES;
    _userNameTextFieldView.layer.cornerRadius = 5.0;
    _userNameTextFieldView.layer.borderWidth = 1.0;
    _userNameTextFieldView.layer.borderColor = [UIColor colorWithRed:164/255.0 green:164/255.0 blue:164/255.0 alpha:1].CGColor;
    _pwdTextFieldView.layer.cornerRadius = 5.0;
    _pwdTextFieldView.layer.borderWidth = 1.0;
    _pwdTextFieldView.layer.borderColor = [UIColor colorWithRed:164/255.0 green:164/255.0 blue:164/255.0 alpha:1].CGColor;
    _loginButton.layer.cornerRadius = 5.0;
    // Do any additional setup after loading the view.
    
    _userNameTextField.delegate = self;
    _pwdTextfield.delegate = self;
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillShowNotification:) name:UIKeyboardWillShowNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillHideNotification:) name:UIKeyboardWillHideNotification object:nil];
//    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
}







#pragma mark -UITextField Delegate
- (void)textFieldDidBeginEditing:(UITextField *)textField
{
    selectTextField = textField;
}




-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self.view endEditing:YES];
}



- (IBAction)finishClick:(id)sender {
    if (_userNameTextField.text.length == 0||_pwdTextfield.text.length == 0) {
        [self showAnimationTitle:@"信息不完整"];
    }else
    {
        NSMutableDictionary *dic = [NSMutableDictionary new];
        if (_userNameTextField.text.length == 11) {
            [dic setObject:_userNameTextField.text forKey:@"MOBILE"];
            [dic setObject:@"1" forKey:@"TYPE"];
        }else if (_userNameTextField.text.length ==18)
        {
            [dic setObject:_userNameTextField.text forKey:@"IDCARD"];
            [dic setObject:[NSNumber numberWithInteger:0] forKey:@"TYPE"];
        }else{
            [self showAnimationTitle:@"用户名为手机号或身份证号"];
            return;
        }
        [self starNetWorking];
        [NetworkInterface commitLoginWithTel:self.userNameTextField.text
                                    password:self.pwdTextfield.text
                                    areaCode:@"110011"
                                successBlock:^(NetworkInterfaceReturnDataModel *returnDataModel) {
                                    [self stopNetWorking];
                                    if (returnDataModel.status == 0) {
                                        NSLog(@"%@",returnDataModel.data);
                                        [OwnInfoSingleton initWihtDictionary:(NSDictionary *)returnDataModel.data];
                                        [self.navigationController popViewControllerAnimated:YES];
                                    }else{
                                        [self showAnimationTitle:@"数据错误"];
                                    }
                                    
                                } failureBlock:^{
                                    [self stopNetWorking];
                                    [self showAnimationTitle:@"网络获取失败"];
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









@end
