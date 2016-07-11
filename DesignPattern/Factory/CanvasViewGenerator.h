//
//  CanvasViewGenerator.h
//  DesignPattern
//
//  Created by jiangqin on 16/7/5.
//  Copyright © 2016年 mopellet. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CanvasView.h"
@interface CanvasViewGenerator : NSObject
- (CanvasView *) canvasViewWithFrame:(CGRect)aFrame;
@end
