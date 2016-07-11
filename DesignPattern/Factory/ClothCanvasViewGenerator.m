//
//  ClothCanvasViewGenerator.m
//  DesignPattern
//
//  Created by jiangqin on 16/7/5.
//  Copyright © 2016年 mopellet. All rights reserved.
//

#import "ClothCanvasViewGenerator.h"

@implementation ClothCanvasViewGenerator
-(CanvasView *)canvasViewWithFrame:(CGRect)aFrame{
    return [[ClothCanvasView alloc] initWithFrame:aFrame];
}
@end
