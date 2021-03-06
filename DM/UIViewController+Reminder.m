//
//  UIViewController+Reminder.m
//  DynamicSChool
//
//  Created by 小屁孩 on 15/8/23.
//  Copyright (c) 2015年 XS. All rights reserved.
//

#import "UIViewController+Reminder.h"

@implementation UIViewController (Reminder)

-(void)showAnimationTitle:(NSString *)title
{
    __block UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"提示" message:title delegate:self cancelButtonTitle:nil otherButtonTitles: nil];
    [alert show];
    double  delayTime = 1.0;
    dispatch_time_t popTime =  dispatch_time(DISPATCH_TIME_NOW, delayTime*NSEC_PER_SEC);
    dispatch_after(popTime, dispatch_get_main_queue(), ^{
        [alert dismissWithClickedButtonIndex:0 animated:YES];
        alert = nil;
    });
}

- (void)starNetWorking
{
    CGSize size = [UIScreen mainScreen].bounds.size;
    UIView *activityBackgroundView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, size.width, size.height)];
    activityBackgroundView.backgroundColor = [UIColor grayColor];
    activityBackgroundView.alpha = 0;
    activityBackgroundView.tag = 554;
    [self.view addSubview:activityBackgroundView];
    UIActivityIndicatorView *activity = [[UIActivityIndicatorView alloc]initWithFrame:CGRectMake((size.width-50)/2, (size.height-50)/2, 50, 50)];
    activity.tag = 555;
    activity.alpha = 0;
    [self.view addSubview:activity];
    [activity startAnimating];
    [UIView animateWithDuration:0.618 animations:^{
        activityBackgroundView.alpha = 0.8;
        activity.alpha = 1;
    }];
}

-(void)stopNetWorking
{
    [UIView animateWithDuration:0.618 animations:^{
        [self.view viewWithTag:554].alpha = 0;
        [self.view viewWithTag:555].alpha = 0;
    }];
    [[self.view viewWithTag:554] removeFromSuperview];
    [[self.view viewWithTag:555] removeFromSuperview];
    [[self.view viewWithTag:556] removeFromSuperview];
}


-(void)h5PageLoading
{
    CGSize size = [UIScreen mainScreen].bounds.size;
    UIView *activityBackgroundView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, size.width, size.height)];
    activityBackgroundView.backgroundColor = [UIColor grayColor];
    activityBackgroundView.alpha = 0;
    activityBackgroundView.tag = 554;
    [self.view addSubview:activityBackgroundView];
    [UIView animateWithDuration:0.618 animations:^{
        activityBackgroundView.alpha = 0.618;
    }];

}


- (void)starNetWorkingWithString:(NSString *)string
{
    CGSize size = [UIScreen mainScreen].bounds.size;
    
    //view
    UIView *activityBackgroundView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, size.width, size.height)];
    activityBackgroundView.backgroundColor = [UIColor grayColor];
    activityBackgroundView.alpha = 0;
    activityBackgroundView.tag = 554;
    [self.view addSubview:activityBackgroundView];
    
    //activity
    UIActivityIndicatorView *activity = [[UIActivityIndicatorView alloc]initWithFrame:CGRectMake((size.width-50)/2, (size.height-50)/2, 50, 50)];
    activity.tag = 555;
    activity.alpha = 0;
    [self.view addSubview:activity];
    
    //label
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(0, size.height/2+25, size.width, 50)];
    label.textAlignment = NSTextAlignmentCenter;
    label.textColor = [UIColor whiteColor];
    label.font = [UIFont systemFontOfSize:15.0];
    label.text = string;
    label.alpha = 0;
    label.tag = 556;
    [self.view addSubview:label];
    
    [activity startAnimating];
    [UIView animateWithDuration:0.618 animations:^{
        activityBackgroundView.alpha = 0.8;
        activity.alpha = 1;
        label.alpha = 1;
    }];
}



-(UIViewController *)storyboardWithstoryboardID:(NSString *)storyboardID
{
    UIStoryboard *sb = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    return [sb instantiateViewControllerWithIdentifier:storyboardID];
}
@end
