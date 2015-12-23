//
//  ManagerDao.h
//  StaffManage
//
//  Created by YanTianFeng on 15-12-23.
//  Copyright (c) 2015年 qianfeng. All rights reserved.
//

#import "Dao.h"

@interface ManagerDao : Dao

/*
    读取用户数据文件(manager.archive文件),返回文件中的用户对象
 */
-(NSArray*)readData;
/*
    写入用户数据到文件(manager.archive文件)
 */
-(BOOL)writeData:(NSArray *)array;

@end
