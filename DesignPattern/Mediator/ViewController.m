//
//  ViewController.m
//  Mediator
//
//  Created by jiangqin on 16/7/6.
//  Copyright © 2016年 mopellet. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    //1.对象间的交互虽定义明确然而非常复杂，导致一组对象彼此相互依赖而难以理解；
    //2.因为对象引用了许多其他对象并与其通讯，导致对象难以复用；
    //3.想要定制一个分布在多个类中的逻辑或者行为，又不想生成太多的子类
    //导航栏控制器就是一个中介者
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
