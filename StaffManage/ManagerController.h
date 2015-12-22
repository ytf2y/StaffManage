//
//  ManagerController.h
//  StaffManage
//
//  Created by YanTianFeng on 15-12-22.
//  Copyright (c) 2015年 qianfeng. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ManagerController : NSObject
/*
    添加管理员,通过指定的name和id
 */
-(BOOL)addManagerWithName:(NSString *)name andPassword:(NSString *)password;
/*
    删除管理员,通过指定的管理员id
 */
-(BOOL)deleteManagerWithId:(NSUInteger)Id;
/*
    列出所有管理员
 */
-(void)listManagers;

@end
