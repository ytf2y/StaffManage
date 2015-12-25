//
//  EmployeeView.m
//  StaffManage
//
//  Created by YanTianFeng on 15-12-24.
//  Copyright (c) 2015年 qianfeng. All rights reserved.
//

#import "EmployeeView.h"
#import "EmployeeController.h"
@implementation EmployeeView

/*
    调用此方法,显示员工管理相关菜单
 */
-(void)menu
{
    
    printf(" |----员工管理\n");
    printf(" | |--[21].增加员工\n");
    printf(" | |--[22].删除员工\n");
    printf(" | |--[23].修改员工信息\n");
    printf(" | |--[24].列出所有员工\n");
}
/*
    增加员工
 */
-(void)add
{
    char name[100] = {};
    char age[100] = {};
    char gender[100] = {};
    char deptId[100] = {};
    printf("员工姓名:");
    scanf("%s",name);
    printf("员工年龄:");
    scanf("%s",age);
    printf("员工性别(1:男,0:女):");
    scanf("%s",gender);
    printf("员工所在部门(部门ID):");
    scanf("%s",deptId);
    BOOL ret = [_ec addEmpWithName:[NSString stringWithUTF8String:name] gender:atoi(gender) age:atol(age) deptId:atol(deptId)];
    if(ret == YES)
    {
        printf("添加员工成功\n");
    }
    else
    {
        printf("添加员工失败\n");
    }
}
/*
    删除员工
 */
-(void)del
{
    char name[100] = {};
    printf("请输入需要删除员工的姓名:");
    scanf("%s",name);
    BOOL ret = [_ec deleteEmpWithName:[NSString stringWithUTF8String:name]];
    if(ret == YES)
    {
        printf("删除员工成功!\n");
    }
    else
    {
        printf("删除员工失败!\n");
    }
}
/*
    修改员工信息
 */
-(void)update
{
    char name[100] = {};
    char age[100] = {};
    char gender[100] = {};
    printf("请输入需要更新员工的姓名:");
    scanf("%s",name);
    printf("请输入新年龄:");
    scanf("%s",age);
    printf("请输入新性别:");
    scanf("%s",gender);
    BOOL ret = [_ec updateEmpAge:atol(age) gender:atoi(gender) ByName:[NSString stringWithUTF8String:name]];
    if(ret == YES)
    {
        printf("更新员工成功!\n");
    }
    else
    {
        printf("更新员工失败!\n");
    }
}
/*
    列出所有员工
 */
-(void)list
{
    
    printf("|------------员工列表------------|\n");
    printf("|ID   |UNAME  |AGE|GENDER|DEPTID|\n");
    printf("|-------------------------------|\n");
    [_ec listEmployees];
    printf("|-------------------------------|\n");
}
@end
