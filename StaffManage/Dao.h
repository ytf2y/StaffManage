//
//  Dao.h
//  StaffManage
//
//  Created by YanTianFeng on 15-12-22.
//  Copyright (c) 2015年 qianfeng. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Dao : NSObject
/*
 创建并返回Dao单例对象
 */
+(instancetype)defaultDao;
/*
    读取项目信息文件(plist文件),返回存有数据的字典对象
 */
-(NSDictionary *)readDataFromInforFile;
/*
    写入数据到项目信息文件(plist文件)
 */
-(BOOL)writeToInforFileWithDict:(NSDictionary *)dict;
/*
 读取用户数据文件(archive文件),返回文件中的用户对象
 */
-(NSArray*)readData;
/*
 写入用户数据到文件(archive文件)
 */
-(BOOL)writeData:(NSArray *)array;

@end
