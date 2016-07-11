//
//  ReubenSandwich.m
//  DesignPattern
//
//  Created by jiangqin on 16/7/8.
//  Copyright © 2016年 mopellet. All rights reserved.
//

#import "ReubenSandwich.h"

@implementation ReubenSandwich



- (void)prepareBread{
    [self cutRyeBread];
}

- (void)addMeat{
    [self addCornBeef];
}

- (void)addCondiments{
    [self addSauerkraut];
    [self addThousandIslandDressing];
    [self addSwissCheese];
}

- (void)extraStep{
    [self grillIt];
}

#pragma mark - 
#pragma mark - mark ReubenSandwich Specific Methonds 

- (void) cutRyeBread{

}

- (void)addCornBeef{

}

- (void)addSauerkraut{

}

-(void)addThousandIslandDressing{

}

- (void)addSwissCheese{

}

- (void)grillIt{
    
}

@end

