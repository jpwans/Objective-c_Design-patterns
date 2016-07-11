//
//  Vertex.m
//  Prototype
//
//  Created by jiangqin on 16/7/4.
//  Copyright © 2016年 mopellet. All rights reserved.
//

#import "Vertex.h"

@implementation Vertex
-(id)initWithLocation:(CGPoint)location{
    self = [super init];
    if (self) {
        [self setLocation:location];
    }
    return self;
}

// 默认属性什么也不做
- (void)setColor:(UIColor *)color{}
- (UIColor *)color{return nil;}
- (void)setSize:(CGFloat)size{}
- (CGFloat)size{return 0.0;}

//Mark操作什么也不做
- (void)addMark:(id<Mark>)mark{}
- (void)removeMark:(id<Mark>)mark{}
- (id<Mark>)childMarkAtIndex:(NSUInteger)index{ return nil; }
- (id<Mark>)lastChild{return nil;}
- (NSUInteger)count{return 0;}
- (NSEnumerator *)enumerator{return nil;}

#pragma mark -
#pragma mark NSCopying method 
// 此方法需要实现，以支持备忘录
- (id)copyWithZone:(NSZone *)zone{
    Vertex * vertexCopy = [[[self class] allocWithZone:zone] initWithLocation:location_];
    return vertexCopy;
}

- (void) drawWithContext:(CGContextRef)context{
    CGFloat x = self.location.x;
    CGFloat y = self.location.y;
    
    CGContextAddLineToPoint(context, x, y);
}

-(void)acceptMarkVisitor:(id<MarkVisitor>)visitor{
    [visitor visitVertex:self];
}




- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    if (self) {
        location_ = [(NSValue *)[coder decodeObjectForKey:@"VertexLocation"] CGPointValue];
    }
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder{
    [aCoder encodeObject:[NSValue valueWithCGPoint:location_] forKey:@"VertexLocation"]
}

@end
