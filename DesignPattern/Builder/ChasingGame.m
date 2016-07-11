//
//  ChasingGame.m
//  DesignPattern
//
//  Created by jiangqin on 16/7/5.
//  Copyright © 2016年 mopellet. All rights reserved.
//

#import "ChasingGame.h"

@implementation ChasingGame
-(Character *)createPlayer:(ChararcterBuilder *)builder{
    [builder buildNewCharacter];
    [builder buildStrength:50.0];
    [builder buildStamina:25.0];
    [builder buildIntelligence:75.0];
    [builder buildAgility:65.0];
    [builder buildAggressiveness:35.0];
    return [builder character];
}

- (Character *)createEnemy:(ChararcterBuilder *)builder{
    [builder buildNewCharacter];
    [builder buildStrength:80.0];
    [builder buildStamina:65.0];
    [builder buildIntelligence:35.0];
    [builder buildAgility:25.0];
    [builder buildAggressiveness:95.0];
    return [builder character];
}

- (Character *)createCharacter:(ChararcterBuilder *)builder type:(ChasingGameType)type{
    Character * character;
    switch (type) {
        case ChasingGameTypePlayer:
            character = [self createPlayer:builder];
            break;
            
        case ChasingGameTypeEnemy:
            character = [self createEnemy:builder];
            break;
            
        default:
            break;
    }
    return character;
}

@end
