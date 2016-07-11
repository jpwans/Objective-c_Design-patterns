//
//  ViewController.m
//  Appearance
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
    //1.子系统正逐渐变得复杂。引用模式的过程中演化出许多类。可以使用外观为这些子系统类提供一个较简单的接口。
    //2.可以使用外观对子系统进行分层。每个子系统级别有一个外观作为入口点。让它们通过其外观进行通信，可以简化它们的依赖关系。
    // 为子系统的一组接口提供简化的接口
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
