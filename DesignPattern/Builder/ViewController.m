//
//  ViewController.m
//  Builder
//
//  Created by jiangqin on 16/7/5.
//  Copyright © 2016年 mopellet. All rights reserved.
//

#import "ViewController.h"
#import "ChasingGame.h"
#import "StandardChararcterBuilder.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    ChararcterBuilder * characterBuilder = [[StandardChararcterBuilder alloc] init];
    ChasingGame * game = [[ChasingGame alloc] init];
    
    Character * player = [game createPlayer:characterBuilder];
    Character * enemy = [game createEnemy:characterBuilder];
    
    [game createCharacter:characterBuilder type:ChasingGameTypePlayer];
    [game createCharacter:characterBuilder type:ChasingGameTypeEnemy];
    // 指导者 -> 具体生成器->抽象生成器->产品
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
