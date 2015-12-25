//
//  DepartmentController.m
//  StaffManage
//
//  Created by YanTianFeng on 15-12-24.
//  Copyright (c) 2015年 qianfeng. All rights reserved.
//

#import "DepartmentController.h"
#import "DepartmentView.h"
#import "View.h"
#import "DepartmentModel.h"
#import "Dao.h"

@interface DepartmentController ()


@end

@implementation DepartmentController

/*
    重写init方法
 */
-(instancetype)init
{
    if(self = [super init])
    {
        _dao = [Dao daoOfDepartment];
        NSArray * array = [_dao readData];
        if(array == nil)
        {
            _mDeptArray = [[NSMutableArray alloc] init];
        }
        else
        {
            _mDeptArray = [[NSMutableArray alloc] initWithArray:array];
        }
        _dv = [View viewOfDepartment];
        _dv.dc = self;
    }
    return self;
}

/*
    调用此方法,添加一个部门.
 */
-(BOOL)addDeptWithName:(NSString *)name
{
    DepartmentModel * dm = [[DepartmentModel alloc] init];
    NSDictionary * dict = [[Dao defaultDao] readDataFromInforFile];
    NSMutableDictionary * mDict = [NSMutableDictionary dictionaryWithDictionary:dict];
    if(dict != nil && [dict[@"department_id"] integerValue] >= 1000)
    {
        dm.Id = [dict[@"department_id"]integerValue] + 1;
        mDict[@"department_id"] =@([dict[@"department_id"]integerValue] + 1);
    }
    else
    {
        dm.Id = 1000;
        mDict[@"department_id"] = @1000;
    }
    //写入数据到文件中.
    BOOL ret = [[Dao defaultDao] writeToInforFileWithDict:mDict];
    if(ret == NO)
    {
        NSLog(@"写入数据到infor文件失败");
    }
    if([self searchDeptWithName:name] != nil)
    {
        return NO;
    }
    dm.name = name;
    dm.count = 0;
    [self.mDeptArray addObject:dm];
    return YES;
}

/*
    调用此方法,删除一个部门
 */
-(BOOL)deleteDeptWithName:(NSString *)name
{
    DepartmentModel * dm = [self searchDeptWithName:name];
    if(dm != nil)
    {
        [_mDeptArray removeObject:dm];
        return YES;
    }
    return NO;
}
/*
    查找部门,通过指定的部门名称查找.
 */
-(DepartmentModel*)searchDeptWithName:(NSString *)name
{
    for(DepartmentModel* dm in _mDeptArray)
    {
        if([name isEqualToString:dm.name] == YES)
        {
            return dm;
        }
    }
    return nil;
}
/*
    调用此方法,列出所有的部门信息
 */
-(void)listDepartments
{
    for(DepartmentModel * dm in _mDeptArray)
    {
        printf("%s\n",[[dm description] UTF8String]);
    }
    
}
/*
    类方法,单例方法,用于创建一个当前类的单例对象
 */
+(instancetype)defaultDepartmentController
{
    static DepartmentController * dc = nil;
    if(dc == nil)
    {
        dc = [[DepartmentController alloc] init];
    }
    return dc;
}
/*
    存储Department对象数据到文件
 */
-(void)writeData
{
    if([_dao writeData:_mDeptArray])
    {
        //printf("写入成功\n");
    }
    else
    {
        printf("写入失败\n");
    }
}

@end
