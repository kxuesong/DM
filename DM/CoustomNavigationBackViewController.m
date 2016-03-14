//
//  CoustomNavigationBackViewController.m
//  DynamicSChool
//
//  Created by tepusoft on 15/11/7.
//  Copyright © 2015年 XS. All rights reserved.
//

#import "CoustomNavigationBackViewController.h"

@interface CoustomNavigationBackViewController ()

@end

@implementation CoustomNavigationBackViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    UIBarButtonItem *lefItem = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"navigationBack"] style:UIBarButtonItemStylePlain target:self action:@selector(navigationBackItemClick)];
    
    self.navigationItem.leftBarButtonItem = lefItem;
}

-(void)navigationBackItemClick
{
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
