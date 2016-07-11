//
//  StandardChararcterBuilder.m
//  DesignPattern
//
//  Created by jiangqin on 16/7/5.
//  Copyright © 2016年 mopellet. All rights reserved.
//

#import "StandardChararcterBuilder.h"

@implementation StandardChararcterBuilder

- (ChararcterBuilder *)buildStrength:(float)value{
    //更新角色的防御值
    self.character.protection *= value;
    //更新角色的攻击值
    self.character.power *=value;
    //最后设定力量值并返回生成器
    return [super buildStrength:value];
}

- (ChararcterBuilder *)buildStamina:(float)value{
    //更新角色的防御值
    self.character.protection *= value;
    //更新角色的攻击值
    self.character.power *=value;
    //最后设定耐力值并返回生成器
    return [super buildStamina:value];
}

- (ChararcterBuilder *)buildIntelligence:(float)value{
    //更新角色的防御值
    self.character.protection *= value;
    //更新角色的攻击值
    self.character.power /=value;
    //最后设定智力值并返回生成器
    return [super buildIntelligence:value];
}

- (ChararcterBuilder *)buildAgility:(float)value{
    //更新角色的防御值
    self.character.protection *= value;
    //更新角色的攻击值
    self.character.power /=value;
    //最后设定敏捷值并返回生成器
    return [super buildAgility:value];
}

- (ChararcterBuilder *)buildAggressiveness:(float)value{
    //更新角色的防御值
    self.character.protection /= value;
    //更新角色的攻击值
    self.character.power *=value;
    //最后设定攻击力值并返回生成器
    return [super buildAggressiveness:value];
}

@end
