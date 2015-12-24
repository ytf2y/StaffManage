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
//        [mc addManagerWithName:@"abc" andPassword:@"abc" andPerm:0];
//        [mc addManagerWithName:@"abcd" andPassword:@"abcd" andPerm:1];
        
//        [mc listManagers];
        [mc viewDidLoad];
//        [mc listManagers];
        

        
    }
    return 0;
}

