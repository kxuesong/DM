//
//  CoustomView.m
//  DM
//
//  Created by tepusoft on 16/1/11.
//  Copyright © 2016年 tepusoft. All rights reserved.
//

#import "CoustomView.h"

@implementation CoustomView


-(void)awakeFromNib
{
    NSLog(@"awakeFromNib:%s",__FUNCTION__);
    self.layer.cornerRadius = 15;
    self.layer.borderWidth = 1.0;
    self.layer.borderColor = [UIColor colorWithRed:44/255.0 green:139/255.0 blue:224/255.0 alpha:1].CGColor;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
