//
//  MarkEnumerator.m
//  DesignPattern
//
//  Created by jiangqin on 16/7/7.
//  Copyright © 2016年 mopellet. All rights reserved.
//

#import "MarkEnumerator.h"
#import "MarkEnumerator+Private.h"
#import "NSMutableArray+Stack.h"
@interface MarkEnumerator ()
{
    @private
    NSMutableArray * stack_;
}
@end
@implementation MarkEnumerator

-(NSArray *)allObjects{
    return [[stack_ reverseObjectEnumerator] allObjects];
}
- (id)nextObject{
    return [stack_ pop];
}

#pragma mark -
#pragma mark Private Methods

- (id)initWithMark:(id<Mark>)mark{
    if (self = [super init]) {
        stack_ = [[NSMutableArray alloc] initWithCapacity:[mark count]];
        
        //遍历整个Mark聚合体
        [self traverseAndBuildStackWithMark:mark];
    }
    return self;
}

- (void)traverseAndBuildStackWithMark:(id<Mark>)mark{
    
    
    if (mark == nil) return;
    [stack_ push:mark];
    NSUInteger index = [mark count];
    id <Mark> childMark;
    while (childMark = [mark childMarkAtIndex:--index]) {
        [self traverseAndBuildStackWithMark:childMark];
    }
    
}
@end
