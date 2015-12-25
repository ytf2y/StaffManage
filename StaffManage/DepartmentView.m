//
//  DepartmentView.m
//  StaffManage
//
//  Created by YanTianFeng on 15-12-24.
//  Copyright (c) 2015年 qianfeng. All rights reserved.
//
#import "DepartmentModel.h"
#import "DepartmentView.h"
#import "DepartmentController.h"

@implementation DepartmentView

/*
    调用此方法显示部门管理相关菜单
 */
-(void)menu
{
    printf(" |----部门管理\n");
    printf(" | |--[11].添加部门\n");
    printf(" | |--[12].删除部门\n");
    printf(" | |--[13].列出所有部门\n");
    
}
/*
    添加部门
 */
-(void)addDept
{
    char name[100]= {};
    printf("部门名称:");
    scanf("%s",name);
    BOOL ret = [self.dc addDeptWithName:[NSString stringWithUTF8String:name]];
    if(ret == YES)
    {
        printf("部门添加成功!\n");
    }
    else
    {
        printf("此部门已存在,添加失败!\n");
    }
}
/*
    删除部门
 */
-(void)delDept
{
    char deptName[100] = {};
    printf("请输入需要删除的部门名称:");
    scanf("%s",deptName);
    BOOL ret = [self.dc deleteDeptWithName:[NSString stringWithUTF8String:deptName]];
    if(ret == YES)
    {
        printf("成功删除部门[%s]\n",deptName);
    }
    else
    {
        printf("删除部门[%s]失败!\n",deptName);
    }
}
/*
    列出所有部门
 */
-(void)listDept
{
    printf("|---------部门列表---------|\n");
    printf("|ID    |UNAME     |COUNT  |\n");
    printf("|-------------------------|\n");
    [_dc listDepartments];
    printf("|-------------------------|\n");
}
@end
