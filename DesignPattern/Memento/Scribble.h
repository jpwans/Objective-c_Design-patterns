//
//  Scribble.h
//  DesignPattern
//
//  Created by jiangqin on 16/7/7.
//  Copyright © 2016年 mopellet. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Mark.h"
#import "ScribbleMemento.h"
extern NSString * const ScribbleObjectUserInfoKey;
extern NSString * const MarkObjectUserInfoKey;
extern NSString * const AddToPreviousMarkUserInfoKey;
@interface Scribble : NSObject
{
    @private
    id <Mark> parentMark_;
    id <Mark> incremntalMark_;
}

// 管理方法
- (void) addMark:(id <Mark>)aMark shouldAddToPreviousMark:(BOOL)shouldAddToPreviousMark;
- (void) removeMark:(id <Mark>)aMark;

// 备忘录方法

- (id) initWithMemento:(ScribbleMemento *)aMemento;
+ (Scribble *) scribbleWithMemento:(ScribbleMemento *) aMemento;
- (ScribbleMemento *) scribbleMemento;
- (ScribbleMemento *) scribbleMementoWithCompleteSnapshot:(BOOL)hasCompleteSnapshot;
- (void) attachStateFromMemento:(ScribbleMemento *) memento;

@end
