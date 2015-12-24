//
//  Login.m
//  StaffManage
//
//  Created by YanTianFeng on 15-12-24.
//  Copyright (c) 2015年 qianfeng. All rights reserved.
//

#import "Login.h"
#import "ManagerController.h"
#import "ManagerView.h"
#import "DepartmentView.h"
#import "EmployeeView.h"

@implementation Login
/*
    重写构造方法
 */
-(instancetype)init
{
    if(self = [super init])
    {
        _mv = [View viewOfManager];
        _dv = [View viewOfDepartment];
        _ev = [View viewOfEmployee];
    }
    return self;
}
/*
    调用此方法,执行登陆
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
        while(1)
        {
            if([_mc isManagerWithName:[NSString stringWithUTF8String:name]] == YES)
            {
                [self.mv menu];
            }
            else
            {
                [self.dv menu];
                [self.ev menu];
                char xuanze[10] = {};
                printf("请选择:");
                scanf("%s",xuanze);
                switch(atoi(xuanze))
                {
                    case 11:[self.dv add];break;
                    case 12:[self.dv del];break;
                    case 13:[self.dv list];break;
                    case 21:[self.ev add];break;
                    case 22:[self.ev del];break;
                    case 23:[self.ev update];break;
                    case 24:[self.ev list];break;
                }
            }
        }
    }
}
/*
    调用此方法,返回Login的单例对象
 */
+(instancetype)defualtLogin
{
    static Login * login = nil;
    if(login == nil)
    {
        login = [[Login alloc] init];
    }
    return login;
}




@end
