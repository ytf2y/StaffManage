//
//  ManagerView.h
//  StaffManager
//
//  Created by YanTianFeng on 15-12-21.
//  Copyright (c) 2015年 qianfeng. All rights reserved.
//

#import "View.h"

@class ManagerController;

@interface ManagerView : View

//ManagerController类的对象指针.
@property (nonatomic,strong) ManagerController * mc;

/*
    用户输入[1],调用此方法.
 */
-(void)add;
/*
    用户输入[2],调用此方法.
 */
-(void)del;
/*
    用户输入[3],调用此方法.
 */
-(void)list;

@end







