//
//  AdviseFeedbackViewController.m
//  DM
//
//  Created by tepusoft on 16/1/11.
//  Copyright © 2016年 tepusoft. All rights reserved.
//

#import "AdviseFeedbackViewController.h"
#import "UIViewController+Reminder.h"

@interface AdviseFeedbackViewController ()

@end

@implementation AdviseFeedbackViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _textView.layer.cornerRadius = 15;
    _textView.layer.borderColor = [UIColor colorWithRed:44/255.0 green:139/255.0 blue:224/255.0 alpha:1].CGColor;
    _textView.layer.borderWidth = 1.0;
    
    _publicButton.layer.cornerRadius = 15;
    
}
- (IBAction)publicButtonClick:(id)sender {
    if ([_textView.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]].length ==0) {
        [self showAnimationTitle:@"填写内容"];
        return;
    }
    [self starNetWorking];
    [self performSelector:@selector(netWorkStop) withObject:nil afterDelay:3];
}

-(void)netWorkStop
{
    [self stopNetWorking];
    [self showAnimationTitle:@"感谢您的反馈,我们会努力做好"];
    [self.navigationController popViewControllerAnimated:YES];
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
