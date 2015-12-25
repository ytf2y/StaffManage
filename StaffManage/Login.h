//
//  Login.h
//  StaffManage
//
//  Created by YanTianFeng on 15-12-24.
//  Copyright (c) 2015年 qianfeng. All rights reserved.
//

#import <Foundation/Foundation.h>

@class ManagerView,DepartmentView,EmployeeView;
/*
    登陆类Login
    负责对用户登陆进行管理
 */
@interface Login : NSObject


//ManagerView类的对象指针
@property (nonatomic,strong) ManagerView * mv;
//DepartmentView类的对象指针
//@property (nonatomic,strong) DepartmentView * dv;
//EmployeeView类的对象指针
//@property (nonatomic,strong) EmployeeView * ev;

/*
    调用此方法,执行登陆
 */
-(void)login;
/*
    调用此方法,返回Login的单例对象
 */
+(instancetype)defualtLogin;


@end
