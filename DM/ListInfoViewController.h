//
//  ListInfoViewController.h
//  DM
//
//  Created by tepusoft on 16/1/10.
//  Copyright © 2016年 tepusoft. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CoustomNavigationBackViewController.h"
@class ScheduleModel;

typedef enum : NSUInteger {
    ScheduleType,
    ColumnsType
} EnterType;

@protocol ListInfoViewControllerDelegate <NSObject>

-(void)listInfoTableViewDidSelected:(id)scheduleModel;

@end

@interface ListInfoViewController : CoustomNavigationBackViewController

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@property (nonatomic, assign) EnterType enterType;

@property (nonatomic, weak) id<ListInfoViewControllerDelegate> delegate;

@end
