//
//  ViewController.m
//  Iterator
//
//  Created by jiangqin on 16/7/7.
//  Copyright © 2016年 mopellet. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    //1.提供了一种顺序访问聚合对象中的元素的方法
    
    //何时使用
    /* 1.需要访问组合对象的内容，而又不暴露其内部表示；
     * 2.需要通过多种方式遍历组合对象；
     * 3.需要提供一个统一的接口，用来遍历各种类型的组合对象
     * Storke.m
     * Mark.h 在这里面
     */
    /*NSEnumerator*/
    NSArray * anArray = ... ;
    NSEnumerator * itemEnumerator = [anArray objectEnumerator];
    
    NSString * item;
    while (item = [itemEnumerator nextObject]) {
        //对 item 作些处理
    }
    
    /*块枚举*/
    anArray  = @[@"This",@"is",@"a",@"test",nil];
    NSString * string = @"test";
    
    [anArray enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        if([obj localizedCaseInsensitiveCompare:string] == NSOrderedSame){
            *stop = YES;//停止
        }
    }];
    
    
    for (NSString * item  in itemEnumerator) {
        //快速枚举
    }
    
//    anArray makeObjectsPerformSelector:<#(nonnull SEL)#> withObject:<#(nullable id)#>
        //向数组中的每个元素发送消息
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
