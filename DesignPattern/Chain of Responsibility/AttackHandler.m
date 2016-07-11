//
//  AttackHandler.m
//  DesignPattern
//
//  Created by jiangqin on 16/7/8.
//  Copyright © 2016年 mopellet. All rights reserved.
//

#import "AttackHandler.h"

@implementation AttackHandler

/**
 *  定义父类的默认行为
 */
- (void) handleAttack:(Attack *)attack{
    [_nextAttackHandler handleAttack:attack];
}

@end
