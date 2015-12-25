//
//  EmployeeDao.h
//  StaffManage
//
//  Created by YanTianFeng on 15-12-24.
//  Copyright (c) 2015年 qianfeng. All rights reserved.
//

#import "Dao.h"

@interface EmployeeDao : Dao

/*
    读取数据文件(employee.archive文件),返回文件中的用户对象
 */
-(NSArray*)readData;
/*
    写入数据到文件(employee.archive文件)
 */
-(BOOL)writeData:(NSArray *)array;

@end
