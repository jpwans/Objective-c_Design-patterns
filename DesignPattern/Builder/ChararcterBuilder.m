//
//  ChararcterBuilder.m
//  DesignPattern
//
//  Created by jiangqin on 16/7/5.
//  Copyright © 2016年 mopellet. All rights reserved.
//

#import "ChararcterBuilder.h"

@implementation ChararcterBuilder
- (ChararcterBuilder *)buildNewCharacter{
    _character = [[Character alloc] init];
    return self;
}

- (ChararcterBuilder *)buildStrength:(float)value{
    _character.strength = value;
    return self;
}
- (ChararcterBuilder *)buildStamina:(float)value{
    _character.stamina = value;
    return self;
}

- (ChararcterBuilder *)buildIntelligence:(float)value{
    _character.intelligence = value;
    return self;
}

- (ChararcterBuilder *)buildAgility:(float)value{
    _character.agility = value;
    return self;
}

- (ChararcterBuilder *)buildAggressiveness:(float)value{
    _character.aggressiveness = value;
    return self;
}

@end
