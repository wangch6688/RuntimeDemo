//
//  LifeCycle.m
//  RuntimeDemo
//
//  Created by chuangchuang wang on 2018/5/3.
//  Copyright © 2018年 chuangchuang wang. All rights reserved.
//

#import "LifeCycle.h"
#import <UIKit/UIKit.h>

@implementation LifeCycle

- (instancetype)init {
    self = [super init];
    if (self) {
        
    }
    return self;
}

/*
 应用的生命周期
 1> 应用程序的状态
 (1) Not Running : 未运行的状态
 (2) Inactice : 未活跃的状态，应用在前台，但是未执行任何操作，无法接收事件，停留时间较短
 (3) Active : 活跃的状态，在前台运行并且可以接受事件
 (4) Background : 后天运行，并且在执行操作
 (5)Suspended : 后台挂起，没有执行代码

 根据应用程序的状态，会调用系统委托类（AppDelegate）中的对应方法： 去往AppDelegate中去看
 
 2> 应用程序启动过程
 用户点击应用图标 -->  main()  -->  UIApplicationMain()  -->  加载主界面设计文件  -->  第一步初始化(AppDelegate)  -->  Restore UI states
 -->  最后的初始化（didFinish） -->  backgrond  -->  active
 
 */


/*
 响应者链：
 
 
 */

//控制状态栏的显示隐藏，true是隐藏
- (BOOL)prefersStatusBarHidden {
    return true;
}

@end
