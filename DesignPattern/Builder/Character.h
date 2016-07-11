//
//  Character.h
//  DesignPattern
//
//  Created by jiangqin on 16/7/5.
//  Copyright © 2016年 mopellet. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 *  定义所有类型角色（游戏者或者敌人）共有的一套特征，包括防御，攻击，力量，耐力，智力，敏捷和攻击力。
 * 力量和耐力 攻击和防御成正比 
 * 智力和敏捷与防御成正比 攻击成反比
 * 攻击力与防御成反比 攻击成正比
 */
@interface Character : NSObject
@property (nonatomic ,assign) float protection;
@property (nonatomic ,assign) float power;
@property (nonatomic ,assign) float strength;
@property (nonatomic ,assign) float stamina;
@property (nonatomic ,assign) float intelligence;
@property (nonatomic ,assign) float agility;
@property (nonatomic ,assign) float aggressiveness;
@end
