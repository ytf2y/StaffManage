//
//  ManagerView.m
//  StaffManager
//
//  Created by YanTianFeng on 15-12-21.
//  Copyright (c) 2015年 qianfeng. All rights reserved.
//

#import "ManagerView.h"
#import "ManagerController.h"
@implementation ManagerView
/*
    超级管理员登陆时,调用此方法
 */
-(void)login
{
    char name[100] = {};
    char password[100] = {};
    int i;
    printf("欢迎使用员工管理信息系统\n");
    printf("       请登陆\n");
    for(i = 1;i <= 3;i++)
    {
        printf("用户名:");
        scanf("%s",name);
        printf("密码:");
        scanf("%s",password);
        if([_mc checkName:[NSString stringWithUTF8String:name] AndPassword:[NSString stringWithUTF8String:password]] == YES)
        {
            printf("登陆成功!\n");
            break;
        }
        else
        {
            if(i < 3)
            {
                printf("用户名/密码错误!剩余%d次登陆机会\n",3-i);
            }
            else
            {
                printf("用户名/密码错误!登陆机会已用完\n");
            }
        }
    }
    if(i < 4)
    {
        [self menu];
    }
}
/*
    超级管理员登陆成功后,调用此方法,显示操作目录.
 */
-(void)menu
{
    printf("----管理员管理页面----\n");
    printf("[1].增加管理员\n");
    printf("[2].删除管理员\n");
    printf("[3].列出管理员\n");
    printf("[4].运营子系统\n");
    printf("请选择:");
    fflush(stdout);
    char xuanze[10] = {};
    scanf("%s",xuanze);
    switch(atoi(xuanze))
    {
        case 1:[self add];break;
        case 2:[self del];break;
        case 3:[self list];break;
    }
}

@end
