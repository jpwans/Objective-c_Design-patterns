//
//  ViewController.m
//  Component
//
//  Created by jiangqin on 16/7/7.
//  Copyright © 2016年 mopellet. All rights reserved.
//

#import "ViewController.h"
#import "Dot.h"
#import "Stroke.h"
#import "Vertex.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    //1. 想获得对象抽象的树形表示（表示-整体层次结构）
    //2. 想让客户端统一处理组合结构中的所有对象
    
    
    Dot * newDot = [[Dot alloc] init];
    Stroke * parentStroke = [[Stroke alloc] init];
    [parentStroke addMark:newDot];
    
    Vertex * newVertex = [[Vertex alloc] init];
    Stroke * newStroke = [[Stroke alloc] init];
    [newStroke addMark:newVertex];
    [parentStroke addMark:newStroke];
    
    //组合有UIView
}


@end
