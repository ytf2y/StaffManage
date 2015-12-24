//
//  View.h
//  StaffManager
//
//  Created by YanTianFeng on 15-12-21.
//  Copyright (c) 2015年 qianfeng. All rights reserved.
//

#import <Foundation/Foundation.h>

@class ManagerView,DepartmentView,EmployeeView;

@interface View : NSObject


-(void)menu;
/*
    创建ManagerView类的单例对象
 */
+(ManagerView*)viewOfManager;
/*
    创建DepartmentView类的单例对象
 */
+(DepartmentView*)viewOfDepartment;
/*
    创建EmployeeView类的单例对象
 */
+(EmployeeView*)viewOfEmployee;

@end







