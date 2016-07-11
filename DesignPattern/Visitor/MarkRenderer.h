//
//  MarkRenderer.h
//  DesignPattern
//
//  Created by jiangqin on 16/7/7.
//  Copyright © 2016年 mopellet. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MarkVisitor.h"
#import "Dot.h"
#import "Vertex.h"
#import "Stroke.h"
@interface MarkRenderer : NSObject <MarkVisitor>
{
    @private
    BOOL shouldMoveContextToDot_;
    
    @protected
    CGContextRef context_;
}

- (id) initWithCGContext:(CGContextRef)context;

- (void) visitMark:(id<Mark>)mark;
- (void) visitDot:(Dot *)dot;
- (void) visitVertex:(Vertex *)vertex;
- (void) visitStroke:(Stroke *)stroke;

@end
