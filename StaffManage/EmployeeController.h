//
//  EmployeeController.h
//  StaffManage
//
//  Created by YanTianFeng on 15-12-24.
//  Copyright (c) 2015年 qianfeng. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Dao,EmployeeView,DepartmentController;

@interface EmployeeController : NSObject

@property (nonatomic,strong) EmployeeView * ev;
@property (nonatomic,strong) Dao * dao;
@property (nonatomic,strong) DepartmentController * dc;
/*
    调用此方法,添加一个员工.
 */
-(BOOL)addEmpWithName:(NSString *)name gender:(BOOL)gender age:(NSUInteger)age deptId:(NSUInteger)deptId;
/*
    调用此方法,删除一个员工
 */
-(BOOL)deleteEmpWithName:(NSString *)name;
/*
    调用此方法,更新指定员工的信息
*/
-(BOOL)updateEmpAge:(NSUInteger)age gender:(BOOL)gender ByName:(NSString *)name;
/*
    调用此方法,列出所有的部门信息
 */
-(void)listEmployees;

/*
    类方法,单例方法,用于创建一个当前类的单例对象
 */
+(instancetype)defaultEmployeeController;
/*
    存储Employee对象数据到文件
 */
-(void)writeData;

@end
