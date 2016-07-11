//
//  ViewController.m
//  Strategy
//
//  Created by jiangqin on 16/7/8.
//  Copyright © 2016年 mopellet. All rights reserved.
//

#import "ViewController.h"
#import "NumbericInputValidator.h"
#import "AlphaInputValidator.h"
#import "CustomTextField.h"
@interface ViewController ()<UITextFieldDelegate>
@property (strong ,nonatomic) CustomTextField * numericTextField;
@property (strong,nonatomic)  CustomTextField * alphaTextField;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [_numericTextField setDelegate:self];
    [_alphaTextField setDelegate:self];
    
    //装饰器模式是外部更改
    //策略模式是内部更改
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)textFieldDidEndEditing:(UITextField *)textField{
    if ([textField isKindOfClass:[CustomTextField class]]) {
        [(CustomTextField *)textField validate];
    }
}



@end
