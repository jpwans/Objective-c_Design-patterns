//
//  ViewController.m
//  Adapter
//
//  Created by jiangqin on 16/7/5.
//  Copyright © 2016年 mopellet. All rights reserved.
//

#import "ViewController.h"
typedef int (^ObjectiveCBlock) (int a);
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    ObjectiveCBlock firstBlock = ^(int anInt){
        return anInt++;
    };
    [firstBlock copy];
    [self dosomething:^int(int a) {
        return 1;
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dosomething:(ObjectiveCBlock)block{
    
}
@end
