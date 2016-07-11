//
//  Scribble.m
//  DesignPattern
//
//  Created by jiangqin on 16/7/7.
//  Copyright © 2016年 mopellet. All rights reserved.
//

#import "Scribble.h"
#import "Stroke.h"
#import "ScribbleMemento+Friend.h"

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
        incremntalMark_ = aMark;
    }
    
    [self didChangeValueForKey:@"mark"];
}

- (void)removeMark:(id<Mark>)aMark{
    [self willChangeValueForKey:@"mark"];
    [parentMark_ removeMark:aMark];
    
    if (aMark == incremntalMark_) {
        incremntalMark_ = nil;
    }
    [self didChangeValueForKey:@"mark"];
}

#pragma mark - 
#pragma mark Methods for memento;

- (id)initWithMemento:(ScribbleMemento *)aMemento{
    if(self == [super init]){
        if ([aMemento hasCompleteSnapshot]) {
            [self setMark:[aMemento mark]];
        }
        else{
            parentMark_ = [[Stroke alloc] init];
            [self attachStateFromMemento:aMemento];
        }
    }
    return self;
}


- (void)attachStateFromMemento:(ScribbleMemento *)memento{
    // 把来自备忘录的对象附加到耿节点
    [self addMark:[memento mark] shouldAddToPreviousMark:NO];
}


- (ScribbleMemento *)scribbleMementoWithCompleteSnapshot:(BOOL)hasCompleteSnapshot{
    id <Mark> mementoMark = incremntalMark_;
    
    // 如果要求返回完整的快照，就把它设为parentMark_
    if (hasCompleteSnapshot) {
        mementoMark = parentMark_;
    }
    // 如果 incremntalMark_是 nil
    else if(mementoMark == nil){
        return nil;
    }
    
    ScribbleMemento * memento = [[ScribbleMemento alloc] initWithMark:mementoMark];
    [memento setHasCompleteSnapshot:hasCompleteSnapshot];
    return memento;
}

- (ScribbleMemento *)scribbleMemento{
    return [self scribbleMementoWithCompleteSnapshot:YES];
}

+ (Scribble *)scribbleWithMemento:(ScribbleMemento *)aMemento{
    Scribble * scribble = [[Scribble alloc] initWithMemento:aMemento];
    return scribble;
}






@end
