//
//  FunctionListViewController.h
//  DM
//
//  Created by tepusoft on 16/1/3.
//  Copyright © 2016年 tepusoft. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CoustomNavigationBackViewController.h"

@interface FunctionListViewController : CoustomNavigationBackViewController
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@property (nonatomic, strong) NSString *channelId;
@property (nonatomic, strong) NSString *rootId;

@end
