//
//  BelowLinePublicTableViewCell.m
//  DM
//
//  Created by tepusoft on 16/1/2.
//  Copyright © 2016年 tepusoft. All rights reserved.
//

#import "BelowLinePublicTableViewCell.h"

@implementation BelowLinePublicTableViewCell

- (void)awakeFromNib {
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
- (IBAction)selectedButtonClick:(UIButton *)sender {
    if (sender.isSelected) {
        [sender setSelected:NO];
    }else{
        [sender setSelected:YES];
    }
    [self.delegate didClickButtonWithTag:self.tag];
}

@end
