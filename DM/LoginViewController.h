//
//  LoginViewController.h
//  DynamicSChool
//
//  Created by 小屁孩 on 15/8/21.
//  Copyright (c) 2015年 XS. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LoginViewController : UIViewController<UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UIImageView *headImageView;

@property (weak, nonatomic) IBOutlet UITextField *userNameTextField;
@property (weak, nonatomic) IBOutlet UITextField *pwdTextfield;
@property (weak, nonatomic) IBOutlet UIButton *loginButton;

@end
