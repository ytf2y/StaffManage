//
//  ManagerController.h
//  StaffManage
//
//  Created by YanTianFeng on 15-12-22.
//  Copyright (c) 2015年 qianfeng. All rights reserved.
//

#import <Foundation/Foundation.h>

@class ManagerView;

@interface ManagerController : NSObject

@property (nonatomic,strong) ManagerView * mv;

/*
    调用此方法 加载界面元素.
 */
-(void)viewDidLoad;
/*
    验证用户名和密码是否正确.
 */
-(BOOL)checkName:(NSString *)name AndPassword:(NSString*)password;
/*
    添加管理员,通过指定的name和id
 */
-(BOOL)addManagerWithName:(NSString *)name andPassword:(NSString *)password andPerm:(NSUInteger)perm;
/*
    删除管理员,通过指定的管理员id
 */
-(BOOL)deleteManagerWithId:(NSUInteger)Id;
/*
    列出所有管理员
 */
-(void)listManagers;

@end
