//
//  Person.m
//  RuntimeDemo
//
//  Created by chuangchuang wang on 2018/4/28.
//  Copyright © 2018年 chuangchuang wang. All rights reserved.
//

#import "Person.h"
#import <objc/message.h>

@implementation Person

- (void)eat {
    NSLog(@"------eat1-------");
}

+ (void)eat {
    NSLog(@"------eat2-------");
}

//默认方法都有两个隐式参数
void show(id self, SEL sel) {
    NSLog(@"self = %@, sel = %@", self, NSStringFromSelector(sel));
}

//当一个对象调用未实现的方法时，会调用这个方法来处理，并且把对应的方法了列表传递过来
//刚好可以用来判断未实现的方法是不是我们想要动态添加的方法
+ (BOOL)resolveInstanceMethod:(SEL)sel {
    if (sel == NSSelectorFromString(@"show")) {
        /*
         参数信息：
         1. 给那个类添加方法
         2. 添加方法的方法编号
         3. 添加方法的方法实现（函数地址）
         4. 函数的类型（返回值 + 参数类型）v：void   @: 对象->self   :表示SEL -> _cmd
         */
        class_addMethod(self, NSSelectorFromString(@"show"), (IMP)show, "v@:");
    }
    return [super resolveInstanceMethod:sel];
}

@end

static const char *key = "mName";
@implementation Person(Property)

- (NSString *)name {
    return objc_getAssociatedObject(self, key);
}

- (void)setName:(NSString *)name {
    objc_setAssociatedObject(self, key, name, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

@end
