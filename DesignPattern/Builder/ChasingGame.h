//
//  ChasingGame.h
//  DesignPattern
//
//  Created by jiangqin on 16/7/5.
//  Copyright © 2016年 mopellet. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "StandardChararcterBuilder.h"

typedef  NS_ENUM(NSInteger, ChasingGameType){
    ChasingGameTypePlayer,
    ChasingGameTypeEnemy,
};

@interface ChasingGame : NSObject

- (Character *) createPlayer:(ChararcterBuilder *) builder;
- (Character *) createEnemy:(ChararcterBuilder *) builder;
- (Character *) createCharacter:(ChararcterBuilder *) builder type:(ChasingGameType) type;

@end
