//
//  BaseModel.h
//  RuntimeDemo
//
//  Created by chuangchuang wang on 2018/5/4.
//  Copyright © 2018年 chuangchuang wang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BaseModel : NSObject

@property(nonatomic, copy) NSString * one;
@property(nonatomic, copy) NSString * two;
@property(nonatomic, copy) NSString * three;

+ (id)modelWithDictionary:(NSDictionary *)dic;

@end
