//
//  H5ViewController.h
//  DM
//
//  Created by tepusoft on 16/1/3.
//  Copyright © 2016年 tepusoft. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CoustomNavigationBackViewController.h"


typedef enum : NSUInteger {
    EnterTypeFraction//积分
} EnterType;
@interface H5ViewController : CoustomNavigationBackViewController
@property (weak, nonatomic) IBOutlet UIWebView *webView;

@property (nonatomic, strong) NSString *urlString;


@property (nonatomic, assign) EnterType enterType;
@end
