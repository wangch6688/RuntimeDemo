//
//  AutoReleasePool.m
//  RuntimeDemo
//
//  Created by chuangchuang wang on 2018/5/3.
//  Copyright © 2018年 chuangchuang wang. All rights reserved.
//

#import "AutoReleasePool.h"

@implementation AutoReleasePool

/*
 1. Objective - C的开发者可使用的内存回收机制：
 1> 手动引用计数和自动释放池
 2> 自动引用技术（ARC）
 3> 自动垃圾回收机制  （iOS并不支持）
 
 2. 增加引用计数的关键字
 alloc new copy mutableCopy retain
 release : 自动引用技术减1
 autorelease : 不改变对象引用计数，将对象添加到自动释放池
 retainCount : 对象的引用技术值
 
 3. 使用自动释放池(autorelease pool) （自动释放池也遵循ARC，以对象的形式存在）
 
 4. 使用弱引用解决强引用循环
 */

- (instancetype)init {
    self = [super init];
    if (self) {
    }
    return self;
}

// 3. autorelease Pool的创建与销毁
- (void)autoreleasePool {
    //create   因为是ARC模式，所以无法使用
    //在target中 buildSetting 中，搜auto，找到Objective - C Automatic Reference Counting
    /*
    NSAutoreleasePool * pool = [[NSAutoreleasePool alloc]init];
     [pool release];
    */
    
    //ARC模式下，开启自动释放池
    @autoreleasepool {
        /*
         系统会自动处理pool中的对象，在引用计数为空的时候，销毁对象，同时，当pool中的代码执行完成，会对所有的对象自动执行release
         */
    }
}

@end
