//
//  AppDelegate.m
//  RuntimeDemo
//
//  Created by chuangchuang wang on 2018/4/28.
//  Copyright © 2018年 chuangchuang wang. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@end

@implementation AppDelegate

//系统将要启动时自动调用该方法，这时应用程序启动时第一次执行自定义代码的机会
-(BOOL)application:(UIApplication *)application willFinishLaunchingWithOptions:(nullable NSDictionary *)launchOptions {
    return YES;
}

//应用程序启动时自动调用该方法，开发者可以在此执行初始化相关的代码（Window）
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    return YES;
}

//应用程序在转入前台，并进入活跃状态会调用该方法
- (void)applicationDidBecomeActive:(UIApplication *)application {
}

//应用程序正要从前台运行状态离开时会调用该方法
- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}

//应用程序正处于background状态，且随时可能进入suspended状态，将会调用该方法
- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

//应用程序正从后台转入前台运行状态，但是暂时还没到达active，将会调用该方法
- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}

//应用程序即将被终止调用该方法
- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
