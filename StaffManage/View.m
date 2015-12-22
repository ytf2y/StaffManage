//
//  View.m
//  StaffManager
//
//  Created by YanTianFeng on 15-12-21.
//  Copyright (c) 2015年 qianfeng. All rights reserved.
//
#import "View.h"
#import "ManagerView.h"
#import "ServiceView.h"
@implementation View

+(instancetype)viewOfManager
{
    static ManagerView * mv = nil;
    if(mv == nil)
    {
        mv = [[ManagerView alloc] init];
    }
    return mv;
}
+(instancetype)viewOfService
{
    static ServiceView * sv = nil;
    if(sv == nil)
    {
        sv = [[ServiceView alloc] init];
    }
    return sv;
}
@end









