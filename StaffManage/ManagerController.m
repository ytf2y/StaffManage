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
#import "ManagerDao.h"
#import "Login.h"

@interface ManagerController ()
//私有化的属性,用来存储多个管理员对象
@property (nonatomic,strong) NSMutableArray * mManaArray;

@end

@implementation ManagerController
/*
    重写无参构造方法
 */
-(instancetype)init
{
    if(self = [super init])
    {
        _dao = [Dao daoOfManager];
        NSArray * array = [_dao readData];
        if(array == nil)
        {
            _mManaArray = [[NSMutableArray alloc] init];
        }
        else
        {
            _mManaArray = [[NSMutableArray alloc] initWithArray:array];
        }
        _mv = [View viewOfManager];
        _mv.mc = self;
        _mv.dv = [View viewOfDepartment];
        _mv.ev = [View viewOfEmployee];
        
        _login = [Login defualtLogin];
        
    }
    return self;
}
/*
 调用此方法 开始执行登陆.
 */
-(void)viewDidLoad
{
    [self.login login];
}
/*
    验证用户名和密码是否正确.
 */
-(BOOL)checkName:(NSString *)name AndPassword:(NSString *)password
{
    for(ManagerModel * mm in _mManaArray)
    {
        if([name isEqualToString:mm.name] && [password isEqualToString:mm.password])
        {
            return YES;
        }
    }
    return NO;
}
/*
 验证是否是管理员
 */
-(BOOL)isManagerWithName:(NSString *)name
{
    for(NSUInteger i = 0;i < _mManaArray.count;i++)
    {
        if([name isEqualToString:[_mManaArray[i] name]] == YES)
        {
            return [_mManaArray[i] perm]?YES:NO;
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
        printf("写入数据到infor文件失败\n");
    }
    if([self searchManagerWithName:name])
    {
        return NO;
    }
    mm.name = name;
    mm.password = password;
    mm.perm = perm;
    
    [self.mManaArray addObject:mm];
//    printf("%s",[[mm description] UTF8String]);
    return YES;
}
/*
    删除管理员,通过指定的管理员name
 */
-(BOOL)deleteManagerWithName:(NSString *)name
{
    ManagerModel * mm = [self searchManagerWithName:name];
    if(mm != nil)
    {
        [_mManaArray removeObject:mm];
        return YES;
    }
    return NO;
}
/*
    列出所有管理员
 */
-(void)listManagers
{
    for(ManagerModel * mm in _mManaArray)
    {
        printf("%s\n",[[mm description] UTF8String]);
    }
}
/*
    查找管理员,通过管理员用户名查找
 */
-(ManagerModel*)searchManagerWithName:(NSString *)name
{
    for(ManagerModel * mm in _mManaArray)
    {
        if([mm.name isEqualToString:name] == YES)
        {
            return mm;
        }
    }
    return nil;
}
/*
    存储对象数据到文件
 */
-(void)writeData
{
    [_dao writeData:_mManaArray];
}
@end
