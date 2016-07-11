//
//  ReubenSandwich.h
//  DesignPattern
//
//  Created by jiangqin on 16/7/8.
//  Copyright © 2016年 mopellet. All rights reserved.
//

#import "AnySandwich.h"

@interface ReubenSandwich : AnySandwich


- (void) prepareBread;

- (void)addMeat;

- (void)addCondiments;

- (void)extraStep;

// 鲁宾三明治特有操作

- (void) cutRyeBread;
- (void) addCornBeef;
- (void) addSauerkraut;
- (void) addThousandIslandDressing;
- (void) addSwissCheese;
- (void) grillIt;
@end
