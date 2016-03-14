//
//  ReSettingPWDViewController.h
//  DM
//
//  Created by tepusoft on 16/1/4.
//  Copyright © 2016年 tepusoft. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ReSettingPWDViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITextField *oldPWDTextField;
@property (weak, nonatomic) IBOutlet UITextField *PWDTextField;
@property (weak, nonatomic) IBOutlet UITextField *affirmTextField;
@property (weak, nonatomic) IBOutlet UIButton *finishButton;

@end
