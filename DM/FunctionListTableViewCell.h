//
//  FunctionListTableViewCell.h
//  DM
//
//  Created by tepusoft on 16/1/3.
//  Copyright © 2016年 tepusoft. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FunctionListTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;

@property (weak, nonatomic) IBOutlet UILabel *smallLabel;

@property (weak, nonatomic) IBOutlet UILabel *timeLabel;

@end
