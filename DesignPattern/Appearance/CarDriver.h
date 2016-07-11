//
//  CarDriver.h
//  DesignPattern
//
//  Created by jiangqin on 16/7/6.
//  Copyright © 2016年 mopellet. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "Car.h"
#import "Taximeter.h"
@interface CarDriver : NSObject

- (void) driveToLocation:(CGPoint)x;
@end
