//
//  ManagerView.m
//  StaffManager
//
//  Created by YanTianFeng on 15-12-21.
//  Copyright (c) 2015年 qianfeng. All rights reserved.
//

#import "ManagerView.h"
#import "ManagerController.h"
#import "EmployeeView.h"
#import "DepartmentView.h"

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
        case 4:break;
        case 0:[self exit];break;
    }
}
/*
    用户输入[1],调用此方法.
 */
-(void)add
{
    char name[100] = {};
    char password1[100] = {};
    char type[10] = {};
//    char password2[100] = {};
    printf("请输入用户名(不能带有空格,中文)\n");
    scanf("%s",name);
//    while(1)
//    {
        printf("请输入密码(不能带有空格,中文)\n");
        scanf("%s",password1);
//        printf("请再次输入密码(不能带有空格)\n");
//        scanf("%s",password2);
//        if(strcmp(password1, password2))
//        {
//            printf("两次密码不一致,请重新输入!\n");
//        }
//        else
//        {
//            break;
//        }
//    }
    printf("请选择管理员类型[1],超级管理员;[0],运营管理员\n");
    scanf("%s",type);
    BOOL ret = [_mc addManagerWithName:[NSString stringWithUTF8String:name] andPassword:[NSString stringWithUTF8String:password1] andPerm:atol(type)];
    if(ret == YES)
    {
        printf("成功添加管理员.\n");
    }
}
/*
    用户输入[2],调用此方法.
 */
-(void)del
{
    char ID[10];
    printf("请输入需要删除的管理员ID:");
    scanf("%s",ID);
    BOOL ret = [_mc deleteManagerWithId:atol(ID)];
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
    printf("|ID   |USERNAME  |PASSWORD|\n");
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
    exit(0);
}
@end
