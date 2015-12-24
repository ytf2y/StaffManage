//
//  View.m
//  StaffManager
//
//  Created by YanTianFeng on 15-12-21.
//  Copyright (c) 2015年 qianfeng. All rights reserved.
//
#import "View.h"
#import "ManagerView.h"
#import "DepartmentView.h"
#import "EmployeeView.h"
@implementation View
-(void)menu
{
    
}
/*
    创建ManagerView类的单例对象
 */
+(ManagerView*)viewOfManager
{
    static ManagerView * mv = nil;
    if(mv == nil)
    {
        mv = [[ManagerView alloc] init];
    }
    return mv;
}
/*
    创建DepartmentView类的单例对象
 */
+(DepartmentView *)viewOfDepartment
{
    static DepartmentView * dv = nil;
    if(dv == nil)
    {
        dv = [[DepartmentView alloc] init];
    }
    return dv;
}
/*
    创建EmployeeView类的单例对象
 */
+(EmployeeView*)viewOfEmployee
{
    static EmployeeView * ev = nil;
    if(ev == nil)
    {
        ev = [[EmployeeView alloc] init];
    }
    return ev;
}
@end









