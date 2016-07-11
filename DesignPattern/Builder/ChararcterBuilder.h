//
//  ChararcterBuilder.h
//  DesignPattern
//
//  Created by jiangqin on 16/7/5.
//  Copyright © 2016年 mopellet. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Character.h"
@interface ChararcterBuilder : NSObject
@property (readonly ,nonatomic) Character * character;

- (ChararcterBuilder *) buildNewCharacter;
- (ChararcterBuilder *) buildStrength:(float)value;
- (ChararcterBuilder *) buildStamina:(float)value;
- (ChararcterBuilder *) buildIntelligence:(float)value;
- (ChararcterBuilder *) buildAgility:(float)value;
- (ChararcterBuilder *) buildAggressiveness:(float)value;
@end
