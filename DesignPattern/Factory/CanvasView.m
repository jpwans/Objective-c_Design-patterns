//
//  CanvasView.m
//  DesignPattern
//
//  Created by jiangqin on 16/7/5.
//  Copyright © 2016年 mopellet. All rights reserved.
//

#import "CanvasView.h"
#import "MarkRenderer.h"
@implementation CanvasView

-(void)drawRect:(CGRect)rect{
    CGContextRef context = UIGraphicsGetCurrentContext();
    MarkRenderer * markRenderer = [[MarkRenderer alloc] initWithCGContext:context];
    [_mark acceptMarkVisitor:markRenderer];
}


@end
