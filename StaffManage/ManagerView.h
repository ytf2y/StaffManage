//
//  ManagerView.h
//  StaffManager
//
//  Created by YanTianFeng on 15-12-21.
//  Copyright (c) 2015年 qianfeng. All rights reserved.
//

#import "View.h"

@class ManagerController,DepartmentController,EmployeeController;

@interface ManagerView : View

//ManagerController类的对象指针.
@property (nonatomic,strong) ManagerController * mc;
//DepartmentController类的对象指针.
//系统退出时,写数据到文件.
@property (nonatomic,strong) DepartmentController * dc;
//EmployeeController类的对象指针.
//系统退出时,写数据到文件.
@property (nonatomic,strong) EmployeeController * ec;

//DepartmentView类的对象指针
@property (nonatomic,strong) DepartmentView * dv;
//EmployeeView类的对象指针
@property (nonatomic,strong) EmployeeView * ev;

//当前登录的用户是否是超级管理员
@property (nonatomic,assign) BOOL issupermanager;


/*
    用户输入[1],调用此方法.
 */
-(void)add;
/*
    用户输入[2],调用此方法.
 */
-(void)del;
/*
    用户输入[3],调用此方法.
 */
-(void)list;
/*
    调用此方法,进入运营子系统
 */
-(BOOL)operate;
/*
    验证用户名和密码是否正确.
 */
-(BOOL)checkName:(NSString *)name AndPassword:(NSString*)password;
/*
    验证是否是管理员
 */
-(BOOL)isManagerWithName:(NSString *)name;

@end







