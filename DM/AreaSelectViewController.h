//
//  AreaSelectViewController.h
//  DM
//
//  Created by tepusoft on 16/1/9.
//  Copyright © 2016年 tepusoft. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CoustomNavigationBackViewController.h"

@protocol  AreaSelectViewControllerDelegate<NSObject>

-(void)AreaSelectViewControllerFinishSelectWithArea:(NSString *)area;

@end

@interface AreaSelectViewController : CoustomNavigationBackViewController
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic, weak) id<AreaSelectViewControllerDelegate> delegate;

@end
