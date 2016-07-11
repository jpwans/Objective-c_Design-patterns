//
//  CanvasViewGenerator.m
//  DesignPattern
//
//  Created by jiangqin on 16/7/5.
//  Copyright © 2016年 mopellet. All rights reserved.
//

#import "CanvasViewGenerator.h"

@implementation CanvasViewGenerator
-(CanvasView *)canvasViewWithFrame:(CGRect)aFrame{
    return [[CanvasView alloc] initWithFrame:aFrame];
}
@end
