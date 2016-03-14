//
//  CategoryVCTableViewCell.h
//  DM
//
//  Created by tepusoft on 15/12/22.
//  Copyright © 2015年 tepusoft. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CategoryVCTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *smallTitleLabel;
@property (weak, nonatomic) IBOutlet UIImageView *headImageView;
@end
