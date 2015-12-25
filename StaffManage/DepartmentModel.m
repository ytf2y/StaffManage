//
//  DepartmentModel.m
//  StaffManage
//
//  Created by YanTianFeng on 15-12-24.
//  Copyright (c) 2015年 qianfeng. All rights reserved.
//

#import "DepartmentModel.h"

@implementation DepartmentModel
/*
    重写description方法
 */
-(NSString *)description
{
    return [NSString stringWithFormat:@"|%-6ld|%-10s|%-7ld|",self.Id,[self.name UTF8String],self.count];
}

-(void)encodeWithCoder:(NSCoder *)aCoder
{
    [aCoder encodeInteger:_count forKey:@"count"];
    [super encodeWithCoder:aCoder];
}
-(id)initWithCoder:(NSCoder *)aDecoder
{
    if(self = [super initWithCoder:aDecoder])
    {
        _count = [aDecoder decodeIntegerForKey:@"count"];
    }
    return self;
}

@end
