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
 
 5. autoreleasepool的一些使用
    1> 什么是@autoreleasepool?
    2> 里面对象的内存什么时候释放?
    3>什么时候要用@autoreleasepool?
 
 回答：
 1> @autoreleasepool是自动释放池，让我们更自由的管理内存
 
 2> 当我们手动创建了一个@autoreleasepool，里面创建了很多临时变量，当@autoreleasepool结束时，里面的内存就会回收
 
 3> ARC时代，系统自动管理自己的autoreleasepool，runloop就是iOS中的消息循环机制，当一个runloop结束时系统才会一次性清理掉被autorelease处理过的对象，其实本质上说是在本次runloop迭代结束时清理掉被本次迭代期间被放到autorelease pool中的对象的。至于何时runloop结束并没有固定的duration。
 方便是方便了，但是有些情况下，我们还是需要手动创建自动释放池，那么，什么时候呢？
 
        (1) 如果你正在编写不基于UI 框架的程序，比如命令行工具。
        (2) 如果你编写的循环创建了很多临时对象。
        (3) 你可以在循环中使用自动释放池block，在下次迭代前处理这些对象。在循环中使用自动释放池block，有助于减少应用程序的内存占用。
        (4) 你生成了一个辅助线程。一旦线程开始执行你必须自己创建自动释放池。否则，应用将泄漏对象。
      这是苹果文档中的翻译，按我的理解，最重要的使用场景，应该是有大量中间临时变量产生时，避免内存使用峰值过高，及时释放内存的场景。
 举个例子:
    [self createAutoreleasePool];
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

//手动创建autorelease pool
- (void)createAutoreleasePool {
    
    NSArray *urls = @[];
    for (NSURL *url in urls) {
        @autoreleasepool {
            NSError *error;
            NSString *fileContents = [NSString stringWithContentsOfURL:url
                                                              encoding:NSUTF8StringEncoding
                                                                 error:&error];
        }
    }
//这个for循环里如果不使用@autoreleasepool，那临时变量内存可能是爆发式的，但是使用了@autoreleasepool，在每个@autoreleasepool结束时，里面的临时变量都会回收，内存使用更加合理。
}

@end
