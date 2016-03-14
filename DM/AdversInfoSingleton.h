//
//  AdversInfoSingleton.h
//  DM
//
//  Created by tepusoft on 16/1/4.
//  Copyright © 2016年 tepusoft. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AdversModel.h"

@interface AdversInfoSingleton : NSObject


@property (nonatomic, strong) AdversModel *adversModel;

+(instancetype)shareManager;

+(void)initWithAdversModel:(AdversModel *)adversModel;
@end
