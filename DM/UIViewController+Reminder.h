//
//  UIViewController+Reminder.h
//  DynamicSChool
//
//  Created by 小屁孩 on 15/8/23.
//  Copyright (c) 2015年 XS. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIViewController (Reminder)

-(void)showAnimationTitle:(NSString *)title;

- (void)starNetWorking;

-(void)stopNetWorking;

- (void)starNetWorkingWithString:(NSString *)string;

-(void)showNoPower;
@end
