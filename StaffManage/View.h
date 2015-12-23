//
//  View.h
//  StaffManager
//
//  Created by YanTianFeng on 15-12-21.
//  Copyright (c) 2015年 qianfeng. All rights reserved.
//

#import <Foundation/Foundation.h>

@class ManagerView,ServiceView;

@interface View : NSObject

-(void)login;
-(void)menu;
+(ManagerView*)viewOfManager;
+(ServiceView*)viewOfService;

@end







