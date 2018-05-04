//
//  Person.h
//  RuntimeDemo
//
//  Created by chuangchuang wang on 2018/4/28.
//  Copyright © 2018年 chuangchuang wang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Person : NSObject

@property(copy, nonatomic) NSString * age;
- (void)eat;
+ (void)eat;

@end

@interface Person(Property)

@property (copy, nonatomic) NSString * name;

@end
