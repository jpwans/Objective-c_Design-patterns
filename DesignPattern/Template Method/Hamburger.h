//
//  Hamburger.h
//  DesignPattern
//
//  Created by jiangqin on 16/7/8.
//  Copyright © 2016年 mopellet. All rights reserved.
//

#import "AnySandwich.h"

@interface Hamburger : AnySandwich


- (void)prepareBread;
- (void)addMeat;
- (void)addCondiments;


// 汉堡包特有方法
- (void) getBurgerBun;
- (void) addKetchup;
- (void) addMustard;
- (void) addBeefPatty;
- (void) addCheese;
- (void) addPickles;

@end
