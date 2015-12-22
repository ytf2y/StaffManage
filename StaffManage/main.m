//
//  main.m
//  StaffManage
//
//  Created by YanTianFeng on 15-12-22.
//  Copyright (c) 2015年 qianfeng. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ManagerController.h"
int main(int argc, const char * argv[])
{

    @autoreleasepool {
        
        ManagerController * mc = [[ManagerController alloc] init];
        BOOL ret = [mc addManagerWithName:@"xxx" andPassword:@"xxx"];
        if(ret)
        {
            printf("添加成功\n");
        }
        ret = [mc addManagerWithName:@"xxxx" andPassword:@"xxxx"];
        if(ret)
        {
            printf("添加成功\n");
        }
        [mc listManagers];
//        NSLog(@"%10@",@"xx");
        
    }
    return 0;
}

