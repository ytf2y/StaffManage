//
//  ManagerModel.m
//  StaffManage
//
//  Created by YanTianFeng on 15-12-22.
//  Copyright (c) 2015年 qianfeng. All rights reserved.
//

#import "ManagerModel.h"

@implementation ManagerModel
/*
    重写父类Human的 归档方法
 */
-(void)encodeWithCoder:(NSCoder *)aCoder
{
    [aCoder encodeObject:_password forKey:@"password"];
    [aCoder encodeInteger:_perm forKey:@"perm"];
    //主动调用父类Human的归档方法,归档父类的成员.
    [super encodeWithCoder:aCoder];
}
/*
    重写父类Human的 解档方法
 */
-(id)initWithCoder:(NSCoder *)aDecoder
{
    //主动调用父类Human的解档方法,解档父类的成员
    if(self = [super initWithCoder:aDecoder])
    {
        _password = [aDecoder decodeObjectForKey:@"password"];
        _perm = [aDecoder decodeIntegerForKey:@"perm"];
    }
    return self;
}

/*
    重写description方法.
 */
-(NSString *)description
{
    return [NSString stringWithFormat:@"%-5ld|%-10s|%-4s|%-3ld",self.Id,[self.name UTF8String],"***",self.perm];
}

@end





