//
//  ManagerController.m
//  StaffManage
//
//  Created by YanTianFeng on 15-12-22.
//  Copyright (c) 2015年 qianfeng. All rights reserved.
//

#import "ManagerController.h"
#import "ManagerView.h"
#import "ManagerModel.h"
#import "Dao.h"
@interface ManagerController ()
//私有化的属性,用来存储多个管理员对象
@property (nonatomic,strong) NSMutableArray * mArray;

@end

@implementation ManagerController
/*
 重写无参构造方法
 */
-(instancetype)init
{
    if(self = [super init])
    {
        _mArray = [[NSMutableArray alloc] init];
        _mv = [View viewOfManager];
        _mv.mc = self;
    }
    return self;
}
/*
 调用此方法 开始执行登陆.
 */
-(void)viewDidLoad
{
    [self.mv login];
}
/*
    验证用户名和密码是否正确.
 */
-(BOOL)checkName:(NSString *)name AndPassword:(NSString *)password
{
    for(ManagerModel * mm in _mArray)
    {
        if([name isEqualToString:mm.name] && [password isEqualToString:mm.password])
        {
            return YES;
        }
    }
    return NO;
}
/*
    添加管理员,通过指定的name和id
 */
-(BOOL)addManagerWithName:(NSString *)name andPassword:(NSString *)password andPerm:(NSUInteger)perm
{
    ManagerModel * mm = [[ManagerModel alloc] init];
    NSDictionary * dict = [[Dao defaultDao] readDataFromInforFile];
    NSMutableDictionary * mDict = [NSMutableDictionary dictionaryWithDictionary:dict];
    if(dict != nil)
    {
        mm.Id = [dict[@"manager_id"]integerValue] + 1;
        mDict[@"manager_id"] =@([dict[@"manager_id"]integerValue] + 1);
    }
    else
    {
        mm.Id = 100;
        mDict[@"manager_id"] = @100;
    }
    //写入数据到文件中.
    BOOL ret = [[Dao defaultDao] writeToInforFileWithDict:mDict];
    if(ret == NO)
    {
        NSLog(@"写入数据到infor文件失败");
    }
    mm.name = name;
    mm.password = password;
    mm.perm = perm;
    
    [self.mArray addObject:mm];
//    printf("%s",[[mm description] UTF8String]);
    return YES;
}
/*
    删除管理员,通过指定的管理员id
 */
-(BOOL)deleteManagerWithId:(NSUInteger)Id
{
    for(ManagerModel * mm in _mArray)
    {
        if(mm.Id == Id)
        {
            [_mArray removeObject:mm];
            return YES;
        }
    }
    return NO;
}
/*
    列出所有管理员
 */
-(void)listManagers
{
//    printf("%ld\n",_mArray.count);
    printf("-------管理员列表-------\n");
    for(ManagerModel * mm in _mArray)
    {
        
        printf("%s\n",[[mm description] UTF8String]);
    }
}

@end
