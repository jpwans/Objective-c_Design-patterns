//
//  ViewController.m
//  AbstractFactory
//
//  Created by jiangqin on 16/7/5.
//  Copyright © 2016年 mopellet. All rights reserved.
//

#import "ViewController.h"
#import "BrandingFactory.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void)loadView{
    //运用定义宏 也可以运用枚举
    BrandingFactory * factory = [BrandingFactory factory];
//    factory  = [BrandingFactory factoryWith:BrandingFactoryTypeAcme]; 
    UIView * view = [factory brandedView];
    UIButton * button = [factory brandedMainButton];
    UIToolbar * toolbar = [factory brandedToolbar];
    
}
@end
