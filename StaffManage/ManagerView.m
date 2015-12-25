//
//  ManagerView.m
//  StaffManager
//
//  Created by YanTianFeng on 15-12-21.
//  Copyright (c) 2015年 qianfeng. All rights reserved.
//

#import "ManagerView.h"
#import "EmployeeView.h"
#import "DepartmentView.h"

#import "ManagerController.h"
#import "DepartmentController.h"
#import "EmployeeController.h"

@implementation ManagerView

/*
    超级管理员登陆成功后,调用此方法,显示操作目录.
 */
-(void)menu
{
    printf("*******管理员管理页面********\n");
    printf("*      [1].增加管理员      *\n");
    printf("*      [2].删除管理员      *\n");
    printf("*      [3].列出管理员      *\n");
    printf("*      [4].运营子系统      *\n");
    printf("*      [0].退出系统        *\n");
    printf("***************************\n");
    printf("请选择:");
    fflush(stdout);
    char xuanze[10] = {};
    scanf("%s",xuanze);
    switch(atoi(xuanze))
    {
        case 1:[self add];break;
        case 2:[self del];break;
        case 3:[self list];break;
        case 4:
        {
            while([self operate]);
            
            break;
        }
        case 0:[self exit];break;
    }
}
/*
    调用此方法,进入运营子系统
    返回值,YES,没输入0
          NO ,输入0
 */
-(BOOL)operate
{
    printf("********运营管理********\n");
    [self.dv menu];
    [self.ev menu];
    printf(" |----其他业务\n");
    if(self.issupermanager)
    {
        printf("   |--[0].返回上一级\n");
    }
    else
    {
        printf("   |--[0].退出系统\n");
    }
    printf("***********************\n");
    char xuanze[10] = {};
    printf("请选择:");
    scanf("%s",xuanze);
    switch(atoi(xuanze))
    {
        case 11:[self.dv addDept];break;
        case 12:[self.dv delDept];break;
        case 13:[self.dv listDept];break;
        case 21:[self.ev add];break;
        case 22:[self.ev del];break;
        case 23:[self.ev update];break;
        case 24:[self.ev list];break;
    }
    if(atoi(xuanze) == 0 && isalnum(xuanze[0]))
    {
        if(self.issupermanager == NO)
        {
            [self exit];
        }
        return NO;
    }
    return YES;
}
/*
    用户输入[1],调用此方法.
 */
-(void)add
{
    char name[100] = {};
    char password[100] = {};
    char type[10] = {};

    while(1)
    {
        printf("请输入用户名(不能带有空格,中文)\n");
        scanf("%s",name);
        printf("请输入密码(不能带有空格,中文)\n");
        scanf("%s",password);
        
        printf("请选择管理员类型[1],超级管理员;[0],运营管理员\n");
        scanf("%s",type);
        BOOL ret = [_mc addManagerWithName:[NSString stringWithUTF8String:name] andPassword:[NSString stringWithUTF8String:password] andPerm:atol(type)];
        if(ret == YES)
        {
            printf("成功添加管理员.\n");
            break;
        }
        else
        {
            printf("用户名重复,添加失败\n");
        }
    }
}
/*
    用户输入[2],调用此方法.
 */
-(void)del
{
    char ID[100] = {};
    printf("请输入需要删除的管理员:");
    scanf("%s",ID);
    BOOL ret = [_mc deleteManagerWithName:[NSString stringWithUTF8String:ID]];
    if(ret == YES)
    {
        printf("成功删除管理员[%s]\n",ID);
    }
}
/*
    用户输入[3],调用此方法.
 */
-(void)list
{
//    printf("*********管理员列表*********\n");
//    printf("|-------------------------|\n");
    printf("|--------管理员列表---------|\n");
    printf("|ID  |UNAME  |PASSW |PERM |\n");
    printf("|-------------------------|\n");
    [_mc listManagers];
    printf("|-------------------------|\n");
}
/*
    退出系统时,调用此方法执行用户数据的持久化操作
 */
-(void)exit
{
    [_mc writeData];
    [_dc writeData];
    [_ec writeData];
    
    exit(0);
}
/*
    验证用户名和密码是否正确.
 */
-(BOOL)checkName:(NSString *)name AndPassword:(NSString*)password
{
    return [_mc checkName:name AndPassword:password];
}
/*
    验证是否是管理员
 */
-(BOOL)isManagerWithName:(NSString *)name
{
    return [_mc isManagerWithName:name];
}
@end
