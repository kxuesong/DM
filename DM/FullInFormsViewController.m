//
//  FullInFormsViewController.m
//  DM
//
//  Created by tepusoft on 16/1/8.
//  Copyright © 2016年 tepusoft. All rights reserved.
//

#import "FullInFormsViewController.h"

@interface FullInFormsViewController ()


@end

@implementation FullInFormsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    //键盘通知
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(keyboardWillShowNotification:) name:UIKeyboardWillShowNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillHideNotification:) name:UIKeyboardWillHideNotification object:nil];
    
    
}
#pragma mark - 自定义方法
// 键盘通知
- (void)keyboardWillShowNotification:(NSNotification *)info
{
    NSDictionary *userInfo = [info userInfo];
    CGSize kbSize = [[userInfo objectForKey:UIKeyboardFrameEndUserInfoKey] CGRectValue].size;
    
    UIView *surper = [_selectControl superview];
    UIScrollView *scrollView = (UIScrollView *)[surper superview];
    CGFloat x=(surper.frame.origin.y + surper.frame.size.height)-(scrollView.contentOffset.y)-(self.view.frame.size.height-kbSize.height);
    _layoutContraint.constant = kbSize.height-49;
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
        _layoutContraint.constant = 0;
        CGRect frame = self.view.frame;
        frame.origin.y = 0;
        [UIView animateWithDuration:0.5 animations:^{
            self.view.frame = frame;
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
