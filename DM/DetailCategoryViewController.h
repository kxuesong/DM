//
//  DetailCategoryViewController.h
//  DM
//
//  Created by tepusoft on 16/1/5.
//  Copyright © 2016年 tepusoft. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CoustomNavigationBackViewController.h"

@interface DetailCategoryViewController : CoustomNavigationBackViewController

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@property (nonatomic, strong) NSArray *tableArray;
@property (nonatomic, strong) NSString *parentId;

@end
