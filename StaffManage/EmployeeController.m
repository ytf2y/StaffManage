//
//  EmployeeController.m
//  StaffManage
//
//  Created by YanTianFeng on 15-12-24.
//  Copyright (c) 2015年 qianfeng. All rights reserved.
//
#import "DepartmentModel.h"
#import "DepartmentController.h"
#import "EmployeeController.h"
#import "EmployeeModel.h"
#import "Dao.h"
#include "View.h"
#import "EmployeeView.h"

@interface EmployeeController ()

//可变数组对象,用来存储多个员工对象
@property (nonatomic,strong) NSMutableArray * mEmpArray;

@end

@implementation EmployeeController
/*
 重写init方法
 */
-(instancetype)init
{
    if(self = [super init])
    {
        _dao = [Dao daoOfEmployee];
        NSArray * array = [_dao readData];
        if(array == nil)
        {
            _mEmpArray = [[NSMutableArray alloc] init];
        }
        else
        {
            _mEmpArray = [[NSMutableArray alloc] initWithArray:array];
        }
        _ev = [View viewOfEmployee];
        _ev.ec = self;
        _dc = [DepartmentController defaultDepartmentController];
    }
    return self;
}
/*
    调用此方法,添加一个员工.
 */
-(BOOL)addEmpWithName:(NSString *)name gender:(BOOL)gender age:(NSUInteger)age deptId:(NSUInteger)deptId
{
    EmployeeModel * em = [[EmployeeModel alloc] init];
    NSDictionary * dict = [[Dao defaultDao] readDataFromInforFile];
    NSMutableDictionary * mDict = [NSMutableDictionary dictionaryWithDictionary:dict];
    if(dict != nil && [dict[@"employee_id"] integerValue] >= 10000)
    {
        em.Id = [dict[@"employee_id"]integerValue] + 1;
        mDict[@"employee_id"] =@([dict[@"employee_id"]integerValue] + 1);
    }
    else
    {
        em.Id = 10000;
        mDict[@"employee_id"] = @10000;
    }
    //写入数据到文件中.
    BOOL ret = [[Dao defaultDao] writeToInforFileWithDict:mDict];
    if(ret == NO)
    {
        NSLog(@"写入数据到infor文件失败");
    }
    //姓名已存在 || 部门ID不存在
    if([self searchEmpWithName:name] != nil || [self searchDeptWithDeptId:deptId] == NO)
    {
        return NO;
    }
    em.name = name;
    em.gender = gender;
    em.age = age;
    em.deptId = deptId;
    [self.mEmpArray addObject:em];
    
    return YES;
}
/*
    调用此方法,删除一个员工
 */
-(BOOL)deleteEmpWithName:(NSString *)name
{
    
    EmployeeModel * em = [self searchEmpWithName:name];
    if(em != nil)
    {
        [_mEmpArray removeObject:em];
        return YES;
    }
    return NO;
}
/*
    调用此方法,更新指定员工的信息
 */
-(BOOL)updateEmpAge:(NSUInteger)age gender:(BOOL)gender ByName:(NSString *)name
{
    EmployeeModel * em = [self searchEmpWithName:name];
    if(em != nil)
    {
        em.age = age;
        em.gender = gender;
        return YES;
    }
    else
    {
        return NO;
    }
}
/*
    查找指定的员工
 */
-(EmployeeModel*)searchEmpWithName:(NSString*)name
{
    for(EmployeeModel* em in _mEmpArray)
    {
        if([name isEqualToString:em.name] == YES)
        {
            return em;
        }
    }
    return nil;
}
/*
    查找指定的部门,是否存在
 */
-(BOOL)searchDeptWithDeptId:(NSUInteger)deptId
{
    for(DepartmentModel * dm in _dc.mDeptArray)
    {
        if(deptId == dm.Id)
        {
            dm.count += 1;
            return YES;
        }
    }
    return NO;
}
/*
    调用此方法,列出所有的部门信息
 */
-(void)listEmployees
{
    for(EmployeeModel * em in _mEmpArray)
    {
        printf("%s\n",[[em description] UTF8String]);
    }
}

/*
    类方法,单例方法,用于创建一个当前类的单例对象
 */
+(instancetype)defaultEmployeeController
{
    static EmployeeController * ec = nil;
    if(ec == nil)
    {
        ec = [[EmployeeController alloc] init];
    }
    return ec;
}
/*
    存储Employee对象数据到文件
 */
-(void)writeData
{
    [_dao writeData:_mEmpArray];
}

@end
