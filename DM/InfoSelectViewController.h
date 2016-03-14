//
//  InfoSelectViewController.h
//  DM
//
//  Created by tepusoft on 16/1/7.
//  Copyright © 2016年 tepusoft. All rights reserved.
//

#import <UIKit/UIKit.h>
@class ChannelModel;

@protocol InfoSelectViewControllerDelegate <NSObject>

-(void)infoSelectViewControllerDidSelectWithTitle:(NSString *)title;

@end
@interface InfoSelectViewController : UIViewController


@property (nonatomic, copy) NSString *findType;

@property (nonatomic, assign) BOOL isWorkPosition;

@property (nonatomic, weak) id<InfoSelectViewControllerDelegate> delegate;

@end
