//
//  Avatar.m
//  DesignPattern
//
//  Created by jiangqin on 16/7/8.
//  Copyright © 2016年 mopellet. All rights reserved.
//

#import "Avatar.h"
#import "Attack.h"
@implementation Avatar
- (void)handleAttack:(Attack *)attack{
    //当攻击到这里我就被击中了
    //实际损伤的点数取决于攻击类型
    NSLog(@"Oh! I'm hit with a %@!",[attack class]);
}
@end
