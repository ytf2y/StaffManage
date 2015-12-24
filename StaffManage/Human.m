//
//  Human.m
//  StaffManage
//
//  Created by YanTianFeng on 15-12-22.
//  Copyright (c) 2015年 qianfeng. All rights reserved.
//

#import "Human.h"

@implementation Human

/*
    实现NSCoding协议中的 归档方法.
 */
-(void)encodeWithCoder:(NSCoder *)aCoder
{
    [aCoder encodeObject:_name forKey:@"name"];
    [aCoder encodeInteger:_Id forKey:@"id"];
}
/*
    实现NSCoding协议中的 解档方法.
 */
-(id)initWithCoder:(NSCoder *)aDecoder
{
    if(self = [super init])
    {
        _name = [aDecoder decodeObjectForKey:@"name"];
        _Id = [aDecoder decodeIntegerForKey:@"id"];
    }
    return self;
}

@end
