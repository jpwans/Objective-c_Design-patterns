//
//  Hamburger.m
//  DesignPattern
//
//  Created by jiangqin on 16/7/8.
//  Copyright © 2016年 mopellet. All rights reserved.
//

#import "Hamburger.h"

@implementation Hamburger



- (void)prepareBread{
    [self getBurgerBun];
}

- (void)addMeat{
    [self addBeefPatty];
}

- (void)addCondiments{
    [self addKetchup];
    [self addMustard];
    [self addCheese];
    [self addPickles];
}

#pragma mark - -
#pragma mark - Hamburger Specific Methods

- (void)getBurgerBun{

}

- (void)addKetchup{

}


- (void)addMustard{

}

- (void)addBeefPatty{

}

- (void)addCheese{

}

- (void)addPickles{

}

@end
