//
//  ViewController.m
//  Chain of Responsibility
//
//  Created by jiangqin on 16/7/8.
//  Copyright © 2016年 mopellet. All rights reserved.
//

#import "ViewController.h"
#import "Avatar.h"
#import "AttackHandler.h"
#import "MetalArmor.h"
#import "CrystalShield.h"
#import "SwordAttack.h"
#import "MagicFireAttack.h"
#import "Attack.h"
#import "LinghtningAttack.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    AttackHandler * avatar = [[ Avatar alloc ]init];
    
    AttackHandler * metalArmoredAvatar = [[MetalArmor alloc] init];
    [metalArmoredAvatar setNextAttackHandler:avatar];
    
    AttackHandler * superAvatar = [[CrystalShield alloc] init];
    [superAvatar setNextAttackHandler:metalArmoredAvatar];
    
    
    // 用剑攻击
    Attack * swordAttack = [[SwordAttack alloc] init];
    [superAvatar handleAttack:swordAttack];
    
    //魔法攻击
    Attack * magicFireAttack = [[MagicFireAttack alloc] init];
    [superAvatar handleAttack:magicFireAttack];
    
    Attack * lightningAttack = [[LinghtningAttack alloc] init];
    [superAvatar handleAttack:lightningAttack];
    
    
    // 每种应付一种攻击
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
