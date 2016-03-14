//
//  AdviseFeedbackViewController.h
//  DM
//
//  Created by tepusoft on 16/1/11.
//  Copyright © 2016年 tepusoft. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CoustomNavigationBackViewController.h"

@interface AdviseFeedbackViewController : CoustomNavigationBackViewController
@property (weak, nonatomic) IBOutlet UIButton *publicButton;

@property (weak, nonatomic) IBOutlet UITextView *textView;
@end
