//
//  BelowLinePublicTableViewCell.h
//  DM
//
//  Created by tepusoft on 16/1/2.
//  Copyright © 2016年 tepusoft. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol BelowLinePublicTableViewCellDeleagete <NSObject>

-(void)didClickButtonWithTag:(NSInteger)tag;

@end

@interface BelowLinePublicTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *smallTitleLabel;
@property (weak, nonatomic) IBOutlet UILabel *timeLabel;

@property (nonatomic, weak) id<BelowLinePublicTableViewCellDeleagete> delegate;
@property (weak, nonatomic) IBOutlet UIButton *selectedButton;

@end
