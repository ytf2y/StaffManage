//
//  Dao.m
//  StaffManage
//
//  Created by YanTianFeng on 15-12-22.
//  Copyright (c) 2015年 qianfeng. All rights reserved.
//

#import "Dao.h"
#import "ManagerDao.h"
@implementation Dao
/*
    读取项目信息文件(plist文件),返回存有数据的字典对象
 */
-(NSDictionary *)readDataFromInforFile
{
    
    NSFileManager * fm = [[NSFileManager alloc] init];
    NSString * path = [[fm currentDirectoryPath] stringByAppendingPathComponent:@"infor.plist"];
    if([fm fileExistsAtPath:path])
    {
        return [[NSDictionary alloc] initWithContentsOfFile:path];
    }
    else
    {
        NSDictionary * dict = @{@"department_id":@0, @"manager_id": @0,@"employee_id":@0};
        BOOL ret =  [dict writeToFile:path atomically:NO];
        if(ret == NO)
        {
            NSLog(@"写入数据到infor文件失败");
        }
    }
    return nil;
}
/*
    写入数据到项目信息文件(plist文件)
 */
-(BOOL)writeToInforFileWithDict:(NSDictionary *)dict
{
    NSFileManager * fm = [[NSFileManager alloc] init];
    NSString * path = [[fm currentDirectoryPath] stringByAppendingPathComponent:@"infor.plist"];
    BOOL ret = [dict writeToFile:path atomically:NO];
    if(ret == NO)
    {
        return NO;
    }
    return YES;
}
-(NSArray *)readData
{
    return nil;
}
-(BOOL)writeData:(NSArray *)array
{
    return NO;
}
+(instancetype)defaultDao
{
    static Dao * dao = nil ;
    if(dao == nil)
    {
        dao = [[Dao alloc] init];
    }
    return dao;
}
+(ManagerDao*)daoOfManager
{
    static ManagerDao * mDao = nil;
    if(mDao == nil)
    {
        mDao = [[ManagerDao alloc] init];
    }
    return mDao;
}
@end
