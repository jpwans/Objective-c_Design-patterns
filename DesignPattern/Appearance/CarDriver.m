//
//  CarDriver.m
//  DesignPattern
//
//  Created by jiangqin on 16/7/6.
//  Copyright © 2016年 mopellet. All rights reserved.
//

#import "CarDriver.h"

@implementation CarDriver
- (void)driveToLocation:(CGPoint)x{
    
    //启动计价器
    Taximeter * meter = [[Taximeter alloc] init];
    [meter start];
    
    //操作车辆直到抵达位置X
    Car * car = [[Car alloc] init];
    [car releaseBrakes];
    [car changeGears];
    [car pressAccelerator];
    
    //当到达了位置X 就停下车和计价器
    [car releaseAccelerator];
    [car pressBrakes];
    [meter stop];
    
    
}
@end
