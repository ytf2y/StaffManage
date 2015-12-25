//
//  DepartmentView.h
//  StaffManage
//
//  Created by YanTianFeng on 15-12-24.
//  Copyright (c) 2015年 qianfeng. All rights reserved.
//

#import "View.h"

@class DepartmentController;

@interface DepartmentView : View

//DepartmentController类的对象指针
@property (nonatomic,strong) DepartmentController
* dc;

/*
    添加部门
 */
-(void)addDept;
/*
    删除部门
 */
-(void)delDept;
/*
    列出所有部门
 */
-(void)listDept;

@end
