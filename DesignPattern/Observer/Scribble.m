//
//  Scribble.m
//  DesignPattern
//
//  Created by jiangqin on 16/7/7.
//  Copyright © 2016年 mopellet. All rights reserved.
//

#import "Scribble.h"
#import "Stroke.h"


NSString * const ScribbleObjectUserInfoKey = @"ScribbleObjectUserInfoKey";
NSString * const MarkObjectUserInfoKey = @"MarkObjectUserInfoKey";
NSString * const AddToPreviousMarkUserInfoKey = @"AddToPreviousMarkUserInfoKey";

@interface Scribble ()
@property (nonatomic ,strong) id <Mark> mark;
@end
@implementation Scribble

- (instancetype)init
{
    self = [super init];
    if (self) {
        parentMark_ = [[Stroke alloc] init];
    }
    return self;
}

#pragma mark - 
#pragma mark Methods for Mark Managemenet 

- (void) addMark:(id<Mark>)aMark shouldAddToPreviousMark:(BOOL)shouldAddToPreviousMark{
    //手工调用KVO
    [self willChangeValueForKey:@"mark"];
    
    // 如果标志设为YES
    // 就把这个aMark加到前一个Mark作为聚合体的一部分
    // 根据我们的设计，它应该是根节点的最后一个子节点
    if (shouldAddToPreviousMark) {
        [[parentMark_ lastChild] addMark:aMark];
    }
    else {
        [parentMark_ addMark:aMark];
    }
    
    [self didChangeValueForKey:@"mark"];
}

- (void)removeMark:(id<Mark>)aMark{
    [self willChangeValueForKey:@"mark"];
    [parentMark_ removeMark:aMark];
    [self didChangeValueForKey:@"mark"];
}




@end
