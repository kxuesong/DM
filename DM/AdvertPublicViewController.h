//
//  AdvertPublicViewController.h
//  DM
//
//  Created by tepusoft on 15/12/26.
//  Copyright © 2015年 tepusoft. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CoustomNavigationBackViewController.h"

@interface AdvertPublicViewController : CoustomNavigationBackViewController
@property (weak, nonatomic) IBOutlet UIButton *advertButton;
@property (weak, nonatomic) IBOutlet UIButton *publicPeriodicalButton;
@property (weak, nonatomic) IBOutlet UITextField *numberTextField;
@property (weak, nonatomic) IBOutlet UIButton *columnButton;
@property (weak, nonatomic) IBOutlet UIButton *specificationsButton;
@property (weak, nonatomic) IBOutlet UITextField *firstRowTextField;
@property (weak, nonatomic) IBOutlet UITextView *contentTextField;
@property (weak, nonatomic) IBOutlet UIButton *historyButton;
@property (weak, nonatomic) IBOutlet UITextField *publicRowTextField;
@property (weak, nonatomic) IBOutlet UISegmentedControl *borderColorSegmentedControl;
@property (weak, nonatomic) IBOutlet UISwitch *topSwitch;

@property (weak, nonatomic) IBOutlet UIButton *publicButton;
@end
