//
//  FlyweightView.m
//  DesignPattern
//
//  Created by jiangqin on 16/7/11.
//  Copyright © 2016年 mopellet. All rights reserved.
//

#import "FlyweightView.h"
#import "FlowerFactory.h"
@implementation FlyweightView


-(void)drawRect:(CGRect)rect{
    for (NSValue * stateValue  in _flowerList) {
        ExtrinsicFlowerState state;
        [stateValue getValue:&state];
        
        UIView * flowerView = state.flowerView;
        CGRect area = state.area;
        
        [flowerView drawRect:area];
    }
}

@end
