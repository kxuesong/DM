//
//  MyViewController.h
//  DM
//
//  Created by tepusoft on 15/12/22.
//  Copyright © 2015年 tepusoft. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface MyViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet UIImageView *headImageView;
@property (weak, nonatomic) IBOutlet UIView *LoginInfoView;
@property (weak, nonatomic) IBOutlet UIButton *LoginButton;
@property (weak, nonatomic) IBOutlet UILabel *nickNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *levelLabel;

@end
