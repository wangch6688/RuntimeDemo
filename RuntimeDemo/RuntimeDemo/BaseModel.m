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

-(void)setValue:(id)value forKey:(NSString *)key {
    if (value == nil || [value isKindOfClass:[NSNull class]] || value == NULL) {
        
        value = @"-";
    }
    [super setValue:value forKey:key];
}

//进行赋值过滤
- (NSString *)description {
    /*
     #pragma clang diagnostic push
     #pragma clang diagnostic ignored "-Wdeprecated-declarations"
     这里写出现警告的代码
     #pragma clang diagnostic pop
     */
    
    unsigned int count;
    const char *clasName    = object_getClassName(self);
    NSMutableString *string = [NSMutableString stringWithFormat:@"<%s: %p>:[ \n",clasName, self];
    Class clas              = NSClassFromString([NSString stringWithCString:clasName encoding:NSUTF8StringEncoding]);
    Ivar *ivars             = class_copyIvarList(clas, &count);
    
    for (int i = 0; i < count; i++) {
        
        @autoreleasepool {
            
            Ivar       ivar  = ivars[i];
            const char *name = ivar_getName(ivar);
            
            //得到类型
            NSString *type   = [NSString stringWithCString:ivar_getTypeEncoding(ivar) encoding:NSUTF8StringEncoding];
            NSString *key    = [NSString stringWithCString:name encoding:NSUTF8StringEncoding];
            id       value   = [self valueForKey:key];
            
            //确保BOOL值输出的是YES 或 NO
            if ([type isEqualToString:@"B"]) {
                value = (value == 0 ? @"NO" : @"YES");
            }
            [string appendFormat:@"\t%@: %@\n",[self deleteUnderLine:key], value];
        }
    }
    [string appendFormat:@"]"];
    return string;
}

/// 去掉下划线
- (NSString *)deleteUnderLine:(NSString *)string{
    
    if ([string hasPrefix:@"_"]) {
        return [string substringFromIndex:1];
    }
    return string;
}

@end




//@implementation NSDictionary(ModelDictionary)
//
//void filtrationDic(id self, SEL sel) {
//    NSLog(@"self = %@, sel = %@",self, NSStringFromSelector(sel));
//}
//
////添加方法
//+ (BOOL)resolveInstanceMethod:(SEL)sel {
//    if (sel == NSSelectorFromString(@"filtrationDic")) {
//        /*
//         参数信息：
//         1. 给那个类添加方法
//         2. 添加方法的方法编号
//         3. 添加方法的方法实现（函数地址）
//         4. 函数的类型（返回值 + 参数类型）v：void   @: 对象->self   :表示SEL -> _cmd
//         */
//        class_addMethod(self, NSSelectorFromString(@"filtrationDic"), (IMP)filtrationDic, "v@:");
//    }
//    return [super resolveClassMethod:sel];
//}
//
//@end
