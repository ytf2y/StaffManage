//
//  EmployeeModel.h
//  StaffManage
//
//  Created by YanTianFeng on 15-12-22.
//  Copyright (c) 2015年 qianfeng. All rights reserved.
//

#import "Human.h"

@interface EmployeeModel : Human

//部门ID
@property (nonatomic,assign) NSUInteger deptId;
//性别
@property (nonatomic,assign) BOOL gender;
//年龄
@property (nonatomic,assign) NSUInteger age;

@end




