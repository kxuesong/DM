//
//  BelowLinePublicViewController.h
//  DM
//
//  Created by tepusoft on 15/12/26.
//  Copyright © 2015年 tepusoft. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CoustomNavigationBackViewController.h"

@interface BelowLinePublicViewController : CoustomNavigationBackViewController
@property (weak, nonatomic) IBOutlet UIButton *acquireInfoButton;
@property (weak, nonatomic) IBOutlet UIButton *searchButton;
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end
