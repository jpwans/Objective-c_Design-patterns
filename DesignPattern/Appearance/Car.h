//
//  Car.h
//  DesignPattern
//
//  Created by jiangqin on 16/7/6.
//  Copyright © 2016年 mopellet. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Car : NSObject

- (void) releaseBrakes; //松刹车
- (void) changeGears; //换挡
- (void) pressAccelerator; //踩油门
- (void) pressBrakes; //踩刹车
- (void) releaseAccelerator; //松油门

@end
