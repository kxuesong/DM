//
//  AdvertisersListViewController.h
//  DM
//
//  Created by tepusoft on 16/1/3.
//  Copyright © 2016年 tepusoft. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CoustomNavigationBackViewController.h"
@class AdversModel;

@protocol AdvertisersListViewControllerDelegate <NSObject>

-(void)didSelectAdvertisers:(AdversModel *)adversModel;

@end

@interface AdvertisersListViewController : CoustomNavigationBackViewController
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet UIButton *provinceButton;
@property (weak, nonatomic) IBOutlet UIButton *cityButton;
@property (weak, nonatomic) IBOutlet UIButton *districtButton;

@property (nonatomic, assign) id<AdvertisersListViewControllerDelegate> delegate;

@end