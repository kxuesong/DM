//
//  ScrollImageModel.h
//  DM
//
//  Created by tepusoft on 16/1/4.
//  Copyright © 2016年 tepusoft. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ScrollImageModel : NSObject

@property (nonatomic, strong) NSString *bigImgUrl;
@property (nonatomic, strong) NSString *Id;
@property (nonatomic, strong) NSString *linkUrl;
@property (nonatomic, strong) NSString *smallImgUrl;
@property (nonatomic, strong) NSString *title;

-(instancetype)initWithDictionary:(NSDictionary *)dictionary;

@end
