//
//  AdvertPublicViewController.m
//  DM
//
//  Created by tepusoft on 15/12/26.
//  Copyright © 2015年 tepusoft. All rights reserved.
//

#import "AdvertPublicViewController.h"
#import "UIViewController+Reminder.h"
#import "AdvertisersListViewController.h"
#import "AdversModel.h"
#import "ListInfoViewController.h"
#import "AdversInfoSingleton.h"
#import "ScheduleModel.h"
#import "ColumnModel.h"

@interface AdvertPublicViewController ()<AdvertisersListViewControllerDelegate,ListInfoViewControllerDelegate>
@property (weak, nonatomic) IBOutlet UIView *advertiserBackgroundView;
@property (weak, nonatomic) IBOutlet UIView *publicDateBackgroundView;
@property (weak, nonatomic) IBOutlet UIView *publicNumberBackgroundView;
@property (weak, nonatomic) IBOutlet UIView *columnsBackgroundView;
@property (weak, nonatomic) IBOutlet UIView *specsBackgroundView;
@property (weak, nonatomic) IBOutlet UIView *firstRowBackgroundView;
@property (weak, nonatomic) IBOutlet UIView *detailContentBackgroundView;
@property (weak, nonatomic) IBOutlet UIView *historyInfoBackgroundView;
@property (weak, nonatomic) IBOutlet UIView *publishBackgroundView;
@property (weak, nonatomic) IBOutlet UIView *addtionBackgroundView;


@property (nonatomic, strong) AdversModel *adverModel;
@property (nonatomic, strong) ScheduleModel *scheduleModel;
@property (nonatomic, strong) ColumnModel *columnModel;

@property (nonatomic, assign) EnterType enteType;


@end

@implementation AdvertPublicViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.advertiserBackgroundView.layer.cornerRadius = 15;
    self.advertiserBackgroundView.layer.borderWidth = 1.0;
    self.advertiserBackgroundView.layer.borderColor = [UIColor colorWithRed:44/255.0 green:139/255.0 blue:224/255.0 alpha:1].CGColor;
    
    self.publicDateBackgroundView.layer.cornerRadius = 15;
    self.publicDateBackgroundView.layer.borderWidth = 1.0;
    self.publicDateBackgroundView.layer.borderColor = [UIColor colorWithRed:44/255.0 green:139/255.0 blue:224/255.0 alpha:1].CGColor;
    
    self.publicNumberBackgroundView.layer.cornerRadius = 15;
    self.publicNumberBackgroundView.layer.borderWidth = 1.0;
    self.publicNumberBackgroundView.layer.borderColor = [UIColor colorWithRed:44/255.0 green:139/255.0 blue:224/255.0 alpha:1].CGColor;
    self.columnsBackgroundView.layer.cornerRadius = 15;
    self.columnsBackgroundView.layer.borderWidth = 1.0;
    self.columnsBackgroundView.layer.borderColor = [UIColor colorWithRed:44/255.0 green:139/255.0 blue:224/255.0 alpha:1].CGColor;
    self.specsBackgroundView.layer.cornerRadius = 15;
    self.specsBackgroundView.layer.borderWidth = 1.0;
    self.specsBackgroundView.layer.borderColor = [UIColor colorWithRed:44/255.0 green:139/255.0 blue:224/255.0 alpha:1].CGColor;
    self.firstRowBackgroundView.layer.cornerRadius = 15;
    self.firstRowBackgroundView.layer.borderWidth = 1.0;
    self.firstRowBackgroundView.layer.borderColor = [UIColor colorWithRed:44/255.0 green:139/255.0 blue:224/255.0 alpha:1].CGColor;
    self.detailContentBackgroundView.layer.cornerRadius = 15;
    self.detailContentBackgroundView.layer.borderWidth = 1.0;
    self.detailContentBackgroundView.layer.borderColor = [UIColor colorWithRed:44/255.0 green:139/255.0 blue:224/255.0 alpha:1].CGColor;
    self.historyInfoBackgroundView.layer.cornerRadius = 15;
    self.historyInfoBackgroundView.layer.borderWidth = 1.0;
    self.historyInfoBackgroundView.layer.borderColor = [UIColor colorWithRed:44/255.0 green:139/255.0 blue:224/255.0 alpha:1].CGColor;
    self.publishBackgroundView.layer.cornerRadius = 15;
    self.publishBackgroundView.layer.borderWidth = 1.0;
    self.publishBackgroundView.layer.borderColor = [UIColor colorWithRed:44/255.0 green:139/255.0 blue:224/255.0 alpha:1].CGColor;
    self.addtionBackgroundView.layer.cornerRadius = 15;
    self.addtionBackgroundView.layer.borderWidth = 1.0;
    self.addtionBackgroundView.layer.borderColor = [UIColor colorWithRed:44/255.0 green:139/255.0 blue:224/255.0 alpha:1].CGColor;


    
    _adverModel = [AdversInfoSingleton shareManager].adversModel?:nil;
    if (_adverModel!=nil) {
        [_advertButton setTitle:_adverModel.name forState:UIControlStateNormal];
    }
    _publicButton.layer.cornerRadius = 15.0;
    
    
}

- (IBAction)adverButtonClick:(id)sender {
    AdvertisersListViewController *vc = (AdvertisersListViewController *)[self storyboardWithstoryboardID:@"AdvertisersListViewController"];
    vc.delegate =self;
    [self.navigationController pushViewController:vc animated:YES];
}
- (IBAction)publicPeriodicalButtonClick:(id)sender {
    _enteType = ScheduleType;
    ListInfoViewController *vc = [[ListInfoViewController alloc]initWithNibName:@"ListInfoViewController" bundle:nil];
    vc.delegate =self;
    vc.enterType = ScheduleType;
    [self.navigationController pushViewController:vc animated:YES];
}
- (IBAction)cloumnButtonClick:(id)sender {
    _enteType = ColumnsType;
    ListInfoViewController *vc = [[ListInfoViewController alloc]initWithNibName:@"ListInfoViewController" bundle:nil];
    vc.delegate =self;
    vc.enterType = ColumnsType;
    [self.navigationController pushViewController:vc animated:YES];
}
- (IBAction)specificationsButtonClick:(id)sender {
}
- (IBAction)historyButtonClick:(id)sender {
}



#pragma mark -  AdvertisersListViewControllerDelegate
-(void)didSelectAdvertisers:(AdversModel *)adversModel
{
    [_advertButton setTitle:adversModel.name forState:UIControlStateNormal];
}

#pragma mark -  ListInfoViewControllerDelegate
-(void)listInfoTableViewDidSelected:(id)model
{
    if (_enteType == ScheduleType) {
        _scheduleModel = model;
        [_publicPeriodicalButton setTitle:[NSString stringWithFormat:@"%@ (第%@期)",_scheduleModel.releasetime,_scheduleModel.yearperiods] forState:UIControlStateNormal];
    }else if (_enteType == ColumnsType){
        _columnModel = model;
        [_columnButton setTitle:_columnModel.name forState:UIControlStateNormal];
    }
    
}
@end
