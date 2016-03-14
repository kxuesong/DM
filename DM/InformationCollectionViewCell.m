//
//  InformationCollectionViewCell.m
//  DM
//
//  Created by tepusoft on 15/12/26.
//  Copyright © 2015年 tepusoft. All rights reserved.
//

#import "InformationCollectionViewCell.h"

@implementation InformationCollectionViewCell

- (void)awakeFromNib {
    self.nameLabel.layer.cornerRadius = 5.0;
    self.nameLabel.layer.borderColor = [UIColor colorWithRed:44/255.0 green:139/255.0 blue:224/255.0 alpha:1].CGColor;
    self.nameLabel.layer.borderWidth = 1.0;
    self.nameLabel.layer.masksToBounds = YES;
}

@end
