//
//  DMLocalObject.h
//  DM
//
//  Created by tepusoft on 15/12/23.
//  Copyright © 2015年 tepusoft. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ChannelModel : NSObject

@property (nonatomic, assign) NSInteger Id;
@property (nonatomic, assign) NSInteger pid;
@property (nonatomic, assign) NSInteger rootid;
@property (nonatomic, assign) NSInteger sort;
@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *descriptions;
@property (nonatomic, strong) NSString *iconsrc;
@property (nonatomic, assign) BOOL islast;
@property (nonatomic, assign) BOOL usetag;
@property (nonatomic, assign) NSInteger layoutkey;
@property (nonatomic, assign) NSInteger level;


@end
