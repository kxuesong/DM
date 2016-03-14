//
//  RegisterViewController.h
//  DynamicSChool
//
//  Created by 小屁孩 on 15/8/21.
//  Copyright (c) 2015年 XS. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CoustomNavigationBackViewController.h"
@interface RegisterViewController :CoustomNavigationBackViewController <UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UITextField *phoneNumberTextField;
@property (weak, nonatomic) IBOutlet UITextField *verificationCodeTextField;
@property (weak, nonatomic) IBOutlet UIButton *sendButton;
@property (weak, nonatomic) IBOutlet UITextField *pwdTextField;
@property (weak, nonatomic) IBOutlet UITextField *confirmPwdTextField;
@property (weak, nonatomic) IBOutlet UIButton *finishButton;
@property (weak, nonatomic) IBOutlet UITextField *emailTextField;
@property (weak, nonatomic) IBOutlet UITextField *inviteTextField;
@property (weak, nonatomic) IBOutlet UIButton *adversButton;

@end
