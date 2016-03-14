//
//  AdversModel.h
//  DM
//
//  Created by tepusoft on 16/1/4.
//  Copyright © 2016年 tepusoft. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AdversModel : NSObject<NSCoding>


@property (nonatomic, strong) NSString *areaId;
@property (nonatomic, strong) NSString *areaName;
@property (nonatomic, strong) NSString *Id;
@property (nonatomic, strong) NSString *name;

-(instancetype)initWithDictionary:(NSDictionary *)dictionary;
@end
