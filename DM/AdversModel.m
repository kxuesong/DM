//
//  AdversModel.m
//  DM
//
//  Created by tepusoft on 16/1/4.
//  Copyright © 2016年 tepusoft. All rights reserved.
//

#import "AdversModel.h"
#import "NSDictionary+StringValue.h"

@implementation AdversModel


-(instancetype)initWithDictionary:(NSDictionary *)dictionary
{
    self = [super init];
    if (self) {
        _areaId = [dictionary stringValueForKey:@"areaId"];
        _areaName = [dictionary stringValueForKey:@"areaName"];
        _Id = [dictionary stringValueForKey:@"id"];
        _name = [dictionary stringValueForKey:@"name"];
    }
    return self;
}

-(void)encodeWithCoder:(NSCoder *)aCoder
{
    [aCoder encodeObject:self.name forKey:@"name"];
    [aCoder encodeObject:self.areaId forKey:@"areaId"];
    [aCoder encodeObject:self.areaName forKey:@"areaName"];
    [aCoder encodeObject:self.Id forKey:@"id"];
}

-(id)initWithCoder:(NSCoder *)aDecoder
{
    if (self = [super init]) {
        self.name = [aDecoder decodeObjectForKey:@"name"];
        self.Id = [aDecoder decodeObjectForKey:@"id"];
        self.areaName = [aDecoder decodeObjectForKey:@"areaName"];
        self.areaId = [aDecoder decodeObjectForKey:@"areaId"];
    }
    return self;
}
@end
