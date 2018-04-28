//
//  ViewController.h
//  RuntimeDemo
//
//  Created by chuangchuang wang on 2018/4/28.
//  Copyright © 2018年 chuangchuang wang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController


@end


@interface UIImage(Image)

+ (instancetype)imageWithName:(NSString *)name;

@end

@interface NSObject (Property)

@property (copy, nonatomic) NSString * name;

@end
