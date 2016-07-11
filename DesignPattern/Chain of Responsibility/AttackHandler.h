//
//  AttackHandler.h
//  DesignPattern
//
//  Created by jiangqin on 16/7/8.
//  Copyright © 2016年 mopellet. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Attack;
@interface AttackHandler : NSObject

@property (nonatomic ,strong) AttackHandler * nextAttackHandler;

- (void) handleAttack:(Attack *)attack;

@end
