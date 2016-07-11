//
//  MetalArmor.m
//  DesignPattern
//
//  Created by jiangqin on 16/7/8.
//  Copyright © 2016年 mopellet. All rights reserved.
//

#import "MetalArmor.h"
#import "SwordAttack.h"
@implementation MetalArmor

-(void)handleAttack:(Attack *)attack{
    if ([attack isKindOfClass:[SwordAttack class]]) {
        NSLog(@"攻击没有通过这个盔甲");
    }
    else{
        NSLog(@"I don't know this attack :%@",[attack class]);
        [super handleAttack:attack];
    }
}
@end
