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
    读取项目信息文件(plist文件),返回存有数据的字典对象
 */
-(NSDictionary *)readDataFromInforFile;
/*
    写入数据到项目信息文件(plist文件)
 */
-(BOOL)writeToInforFileWithDict:(NSDictionary *)dict;
/*
    创建并返回单例对象
 */
+(instancetype)defaultDao;

@end
