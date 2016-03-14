//
//  ReSettingPWDViewController.m
//  DM
//
//  Created by tepusoft on 16/1/4.
//  Copyright © 2016年 tepusoft. All rights reserved.
//

#import "ReSettingPWDViewController.h"
#import "UIViewController+Reminder.h"
#import "NetworkInterface.h"

@interface ReSettingPWDViewController ()
@property (weak, nonatomic) IBOutlet UIView *oldPWDTextFieldView;
@property (weak, nonatomic) IBOutlet UIView *PWDTextFieldView;
@property (weak, nonatomic) IBOutlet UIView *affirmTextFieldView;

@end

@implementation ReSettingPWDViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _oldPWDTextFieldView.layer.cornerRadius = 5.0;
    _oldPWDTextFieldView.layer.borderWidth = 1.0;
    _oldPWDTextFieldView.layer.borderColor = [UIColor colorWithRed:164/255.0 green:164/255.0 blue:164/255.0 alpha:1].CGColor;
    _PWDTextFieldView.layer.cornerRadius = 5.0;
    _PWDTextFieldView.layer.borderWidth = 1.0;
    _PWDTextFieldView.layer.borderColor = [UIColor colorWithRed:164/255.0 green:164/255.0 blue:164/255.0 alpha:1].CGColor;
    _affirmTextFieldView.layer.cornerRadius = 5.0;
    _affirmTextFieldView.layer.borderWidth = 1.0;
    _affirmTextFieldView.layer.borderColor = [UIColor colorWithRed:164/255.0 green:164/255.0 blue:164/255.0 alpha:1].CGColor;
    _finishButton.layer.cornerRadius = 5.0;
    // Do any additional setup after loading the view.
}


- (IBAction)finishButtonClick:(id)sender {
    
    if (_oldPWDTextField.text.length == 0||_PWDTextField.text.length == 0||_affirmTextField.text.length == 0) {
        [self showAnimationTitle:@"请填写完整"];
    }else if (![_PWDTextField.text isEqualToString:_affirmTextField.text]){
        [self showAnimationTitle:@"两次密码不一致"];
    }else{
        [NetworkInterface updatePasswordWithId:@""
                                   oldPassword:@""
                                   newPassword:@""
                                       keyCode:@""
                                  successBlock:^(NetworkInterfaceReturnDataModel *returnDataModel) {
                                      
                                  }
                                  failureBlock:^{
                                      
                                  }];
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
