//
//  EmployeeView.h
//  StaffManage
//
//  Created by YanTianFeng on 15-12-24.
//  Copyright (c) 2015年 qianfeng. All rights reserved.
//

#import "View.h"

@class EmployeeController;

@interface EmployeeView : View

//EmployeeController类的对象指针
@property (nonatomic,strong) EmployeeController
* ec;

/*
    添加员工
 */
-(void)add;
/*
    删除员工
 */
-(void)del;
/*
    修改员工信息
 */
-(void)update;
/*
    列出所有员工
 */
-(void)list;

@end
