//
//  PersonalInfoTableViewController.m
//  DM
//
//  Created by tepusoft on 16/1/4.
//  Copyright © 2016年 tepusoft. All rights reserved.
//

#import "PersonalInfoTableViewController.h"
#import "OwnInfoSingleton.h"
#import "UIImageView+WebCache.h"


@interface PersonalInfoTableViewController ()

@end

@implementation PersonalInfoTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [_headImageView sd_setimagewithString:[OwnInfoSingleton sharedManager].headimg placeholderImage:[UIImage imageNamed:@"login_head"]];
    _userNameLabel.text = [OwnInfoSingleton sharedManager].name;
    _nickNameLabel.text = [OwnInfoSingleton sharedManager].nickname;
    _emailLabel.text = [OwnInfoSingleton sharedManager].email;
    _addressLabel.text = [OwnInfoSingleton sharedManager].address;
    _scoreLabel.text = [OwnInfoSingleton sharedManager].jifen;
  
}




@end
