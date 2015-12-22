//
//  ManagerModel.m
//  StaffManage
//
//  Created by YanTianFeng on 15-12-22.
//  Copyright (c) 2015年 qianfeng. All rights reserved.
//

#import "ManagerModel.h"

@implementation ManagerModel

-(NSString *)description
{
    return [NSString stringWithFormat:@"%-5ld,%-10s,%-3s",self.Id,[self.name UTF8String],"***"];
}

@end
