//
//  DepartmentController.h
//  StaffManage
//
//  Created by YanTianFeng on 15-12-24.
//  Copyright (c) 2015年 qianfeng. All rights reserved.
//

#import <Foundation/Foundation.h>

@class DepartmentView,Dao;


@interface DepartmentController : NSObject
//可变数组对象,用来存储多个部门对象
@property (nonatomic,strong) NSMutableArray * mDeptArray;
@property (nonatomic,strong) DepartmentView * dv;
@property (nonatomic,strong) Dao * dao;
/*
    调用此方法,添加一个部门.
 */
-(BOOL)addDeptWithName:(NSString *)name;
/*
    调用此方法,删除一个部门
 */
-(BOOL)deleteDeptWithName:(NSString *)name;
/*
    调用此方法,列出所有的部门信息
 */
-(void)listDepartments;

/*
    类方法,单例方法,用于创建一个当前类的单例对象
 */
+(instancetype)defaultDepartmentController;
/*
    存储Department对象数据到文件
 */
-(void)writeData;
@end
