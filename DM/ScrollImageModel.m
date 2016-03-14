//
//  ScrollImageModel.m
//  DM
//
//  Created by tepusoft on 16/1/4.
//  Copyright © 2016年 tepusoft. All rights reserved.
//

#import "ScrollImageModel.h"
#import "NSDictionary+StringValue.h"
@implementation ScrollImageModel

-(instancetype)initWithDictionary:(NSDictionary *)dictionary
{
    self = [super init];
    if (self) {
        _bigImgUrl = [dictionary stringValueForKey:@"bigimgurl"];
        _Id = [dictionary stringValueForKey:@"id"];
        _linkUrl = [dictionary stringValueForKey:@"linkurl"];
        _smallImgUrl = [dictionary stringValueForKey:@"smallimgurl"];
        _title = [dictionary stringValueForKey:@"title"];
    }
    return self;
}

@end
