//
//  ManagerView.m
//  StaffManager
//
//  Created by YanTianFeng on 15-12-21.
//  Copyright (c) 2015年 qianfeng. All rights reserved.
//

#import "ManagerView.h"

@implementation ManagerView

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
