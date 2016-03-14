//
//  PersonalInfoTableViewController.h
//  DM
//
//  Created by tepusoft on 16/1/4.
//  Copyright © 2016年 tepusoft. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PersonalInfoTableViewController : UITableViewController
@property (weak, nonatomic) IBOutlet UIImageView *headImageView;
@property (weak, nonatomic) IBOutlet UILabel *userNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *nickNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *emailLabel;
@property (weak, nonatomic) IBOutlet UILabel *addressLabel;
@property (weak, nonatomic) IBOutlet UILabel *scoreLabel;

@end
