//
//  Human.h
//  StaffManage
//
//  Created by YanTianFeng on 15-12-22.
//  Copyright (c) 2015年 qianfeng. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Human : NSObject
//区分每个人的 唯一的Id
@property (nonatomic,assign) NSUInteger Id;
//姓名
@property (nonatomic,copy) NSString * name;

@end
