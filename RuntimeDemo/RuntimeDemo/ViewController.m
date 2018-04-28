//
//  ViewController.m
//  RuntimeDemo
//
//  Created by chuangchuang wang on 2018/4/28.
//  Copyright © 2018年 chuangchuang wang. All rights reserved.
//

#import "ViewController.h"
#import <objc/message.h>
#import "Person.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    /*
     1. 发送消息（消息发送机制）
     方法调用的本质，就是让对象发送消息
     objc_msgSend，只有对象才能够发送消息
     使用runtime的前提是必须导入#import<objc/message.h>
     xcode6之后，apple不推荐使用runtime，所以使用时不提示runtime的function参数，所以需要在buildSetting中搜索msg，将yes改成no
     */
//    [self messgaeSimpleUse];
    
    /*
     2. 交换方法
     使用场景： 系统自带的方法功能不够，给系统自带的方法扩展一些功能，并且保持原有的功能
     1> 继承系统的类，重写方法
     2> 使用runtime，交换方法
     */
//    [self exchangeFuntion];
    
    /*
     3. 动态添加方法
     使用场景： 如果一个系统的类方法特别多，加载类到内存的时候也会比较耗费资源（OC是懒加载机制，动态添加方法在用到的时候去加载），需要给每个方法生成映射表，可以使用动态给某个类，添加方法解决。
              performSelector方法的使用
     */
    [self dynamicAddedFunction];
}

// 消息机制的简单使用
- (void)messgaeSimpleUse {
    //创建对象
    Person * per = [[Person alloc]init];
    //调用对象方法
    [per eat];
    //本质
    objc_msgSend(per, @selector(eat));
 //-------- --------
    //调用类方法的方式： 两种
    //1> 类名调用
    [Person eat];
    //2> 类对象调用
    [[Person class] eat];
    //无论使用哪种方法调用，底层会自动将其转成类调用方法，即 ：
    objc_msgSend([Person class], @selector(eat));
    
    //消息机制原理： 对象根据方法编号SEL去映射表中查找对应的方法实现
}

//交换方法
- (void)exchangeFuntion {
    /*
     模拟一种场景： 给imageNamed方法提供功能，每次加载图片就判断图片是否加载成功
     步骤1 ：先做一个分类，定义一个能加载图片并且能够打印的方法 + （instancetype）imageWithName:(NSSting *)name
     步骤2 ：交换imageNamed和imageWithName的实现，就能调用imageWithName，或者说间接调用imageWithName的实现
     */
    UIImage * image = [UIImage imageNamed:@"1234"];
    NSLog(@"image = %@", image);
}

//3. 动态添加方法
- (void)dynamicAddedFunction {
    Person * p = [[Person alloc]init];
    [p performSelector:@selector(show)];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end

@implementation UIImage(Image)

//步骤2 --> load是image加载到内存时候调用的系统方法
+ (void)load {
    
//  exchange  Method
    Method imageWithName = class_getClassMethod(self, @selector(imageWithName:));
    NSLog(@"self.class1 = %@", self);
    Method imageNamed = class_getClassMethod(self, @selector(imageNamed:));
    NSLog(@"self.class2 = %@", self);
    //exchange
    method_exchangeImplementations(imageWithName, imageNamed);
}

//步骤1 --> 创建我们需要交换的自定义方法
//tip : 不能再分类中重写系统方法imageNamed，因为会把系统方法给覆盖，而且分类中无法调用super
+ (instancetype)imageWithName:(NSString *)name {
    UIImage * image = [self imageWithName:name];
    if (image == nil) {
        NSLog(@"----加载空的图片----");
//        image = [self imageWithName:@"123"];
    }
    return image;
    //方法交换的本质是SEL指向的方法实现变了
    //当再次调用imageNamed调用的是imageWithName的方法实现，同理调用imageWithName时，实现的是系统方法imageNamed
}

@end
