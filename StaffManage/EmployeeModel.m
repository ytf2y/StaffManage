//
//  EmployeeModel.m
//  StaffManage
//
//  Created by YanTianFeng on 15-12-22.
//  Copyright (c) 2015年 qianfeng. All rights reserved.
//

#import "EmployeeModel.h"

@implementation EmployeeModel

/*
    重写description方法
 */
-(NSString *)description
{
    return [NSString stringWithFormat:@"|%-5ld|%-7s|%-3ld|%-6d|%-6ld|",self.Id,[self.name UTF8String],self.age,self.gender,self.deptId];
}
-(void)encodeWithCoder:(NSCoder *)aCoder
{
    [aCoder encodeInteger:_age forKey:@"age"];
    [aCoder encodeBool:_gender forKey:@"gender"];
    [aCoder encodeInteger:_deptId forKey:@"deptId"];
    [super encodeWithCoder:aCoder];
}
-(id)initWithCoder:(NSCoder *)aDecoder
{
    if(self = [super initWithCoder:aDecoder])
    {
        _age = [aDecoder decodeIntegerForKey:@"age"];
        _gender = [aDecoder decodeBoolForKey:@"gender"];
        _deptId = [aDecoder decodeIntegerForKey:@"deptId"];
    }
    return self;
}
@end
