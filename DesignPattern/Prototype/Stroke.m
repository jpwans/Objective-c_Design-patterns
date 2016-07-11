//
//  Stroke.m
//  Prototype
//
//  Created by jiangqin on 16/7/4.
//  Copyright © 2016年 mopellet. All rights reserved.
//

#import "Stroke.h"
#import "MarkEnumerator+Private.h"
@implementation Stroke
@synthesize color = color_, size = size_;
@dynamic location;

- (instancetype)init
{
    self = [super init];
    if (self) {
        children_ = [[NSMutableArray alloc] initWithCapacity:5];
    }
    return self;
}

- (void)setLocation:(CGPoint)location{
    //不做任何位置设定
}

- (CGPoint)location{
    if ([children_ count]) {
        id<Mark> mark = [children_ objectAtIndex:0];
        return [mark location];
    }
    return CGPointZero;
}

- (void)addMark:(id<Mark>)mark{
    [children_ addObject:mark];
}

- (void)removeMark:(id<Mark>)mark{
    //如果mark在这一层，将其移除并返回
    //否则让每个子节点去找它
    if ([children_ containsObject:mark]) {
        [children_ removeObject:mark];
    }
    else{
        [children_ makeObjectsPerformSelector:@selector(removeMark:) withObject:mark];
    }
}

- (id<Mark>)childMarkAtIndex:(NSUInteger)index{
    if (index >= [children_ count])  return nil;
    return [children_ objectAtIndex:index];
}

-(id<Mark>)lastChild{
    return [children_ lastObject];
}

-(NSUInteger)count{
    return [children_ count];
}

#pragma mark - 
#pragma mark NSCopying method 
-(id)copyWithZone:(NSZone *)zone{
    Stroke * strokeCpoy = [[[self class] allocWithZone:zone] init];
    
    [strokeCpoy setColor:[UIColor colorWithCGColor:[color_ CGColor]]];
    
    [strokeCpoy setSize:size_];
    
    //复制 children
    for (id <Mark> child in children_) {
        id<Mark> childCopy = [child copy];
        [strokeCpoy addMark:childCopy];
    }
    return strokeCpoy;
}


- (void) drawWithContext:(CGContextRef)context{
    CGContextMoveToPoint(context, self.location.x, self.location.y);
    
    for (id <Mark> mark in children_) {
        [mark drawWithContext:context];
    }
    CGContextSetStrokeColorWithColor(context, self.color.CGColor);
    
    CGContextStrokePath(context);
}


#pragma mark - 
#pragma mark enumerator method
- (NSEnumerator *)enumerator{
    return [[MarkEnumerator alloc] initWithMark:self];
}

- (void)enumerateMarksUsingBlock:(MarkEnumerationBlock)block{
    BOOL stop = NO;
    
    NSEnumerator * enumerator = [self enumerator];
    for (id <Mark> mark in enumerator) {
        block(mark,&stop);
        if (stop) {
            break;
        }
    }
}



-(void)acceptMarkVisitor:(id<MarkVisitor>)visitor{
    for (id <Mark> dot in children_) {
        [dot acceptMarkVisitor:visitor];
    }
    [visitor visitStroke:self];
}


- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    if (self) {
        color_ = [coder decodeObjectForKey:@"StrokeColor"];
        size_ = [coder decodeObjectForKey:@"StrokeSize"];
        children_ = [coder decodeObjectForKey:@"StrokeChildren"];
    }
    return self;
}


- (void)encodeWithCoder:(NSCoder *)coder
{
    [super encodeWithCoder:coder];
    [coder encodeObject:color_ forKey:@"StrokeColor"];
    [coder encodeObject:size_ forKey:@"StrokeSize"];
    [coder encodeObject:children_ forKey:@"StorkeChildren"];
}










@end
