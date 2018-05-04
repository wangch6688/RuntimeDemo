//
//  BaseModel.m
//  RuntimeDemo
//
//  Created by chuangchuang wang on 2018/5/4.
//  Copyright © 2018年 chuangchuang wang. All rights reserved.
//

#import "BaseModel.h"
#import <objc/message.h>

@implementation BaseModel

-(void)setValue:(id)value forUndefinedKey:(NSString *)key {
    if (value == nil || [value isKindOfClass:[NSNull class]] || value == NULL) {
        value = @"--";
        NSLog(@"-----------key's class = %@------------", [key class]);
    }
}

+ (id)modelWithDictionary:(NSDictionary *)dic {
    __strong Class model = [[[self class] alloc] init];
    [model setValuesForKeysWithDictionary:dic];
    return model;
}
@end

@implementation NSDictionary(ModelDictionary)

void filtrationDic(id self, SEL sel) {
    NSLog(@"self = %@, sel = %@",self, NSStringFromSelector(sel));
}

//添加方法
+ (BOOL)resolveInstanceMethod:(SEL)sel {
    if (sel == NSSelectorFromString(@"filtrationDic")) {
        /*
         参数信息：
         1. 给那个类添加方法
         2. 添加方法的方法编号
         3. 添加方法的方法实现（函数地址）
         4. 函数的类型（返回值 + 参数类型）v：void   @: 对象->self   :表示SEL -> _cmd
         */
        class_addMethod(self, NSSelectorFromString(@"filtrationDic"), (IMP)filtrationDic, "v@:");
    }
    return [super resolveClassMethod:sel];
}

@end
