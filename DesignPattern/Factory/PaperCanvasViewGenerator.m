//
//  PaperCanvasViewGenerator.m
//  DesignPattern
//
//  Created by jiangqin on 16/7/5.
//  Copyright © 2016年 mopellet. All rights reserved.
//

#import "PaperCanvasViewGenerator.h"

@implementation PaperCanvasViewGenerator
- (CanvasView *)canvasViewWithFrame:(CGRect)aFrame{
    return [[PaperCanvasView alloc] initWithFrame:aFrame];
}

@end
