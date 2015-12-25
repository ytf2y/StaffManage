//
//  EmployeeDao.m
//  StaffManage
//
//  Created by YanTianFeng on 15-12-24.
//  Copyright (c) 2015年 qianfeng. All rights reserved.
//

#import "EmployeeDao.h"

@implementation EmployeeDao

/*
    读取数据文件(employee.archive文件),返回文件中的用户对象
 */
-(NSArray*)readData
{
    NSFileManager * fm = [[NSFileManager alloc] init];
    NSString * path = [[fm currentDirectoryPath] stringByAppendingPathComponent:@"employee.archive"];
    if([fm fileExistsAtPath:path] == YES)
    {
        NSArray * array = [NSKeyedUnarchiver unarchiveObjectWithFile:path];
        return array;
    }
    else
    {
        return nil;
    }
}
/*
    写入数据到文件(employee.archive文件)
 */
-(BOOL)writeData:(NSArray *)array
{
    NSFileManager * fm = [[NSFileManager alloc] init];
    NSString * path = [[fm currentDirectoryPath] stringByAppendingPathComponent:@"employee.archive"];
    BOOL ret = [NSKeyedArchiver archiveRootObject:array toFile:path];
    return ret;
}

@end
