//
//  Scribble.h
//  DesignPattern
//
//  Created by jiangqin on 16/7/7.
//  Copyright © 2016年 mopellet. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Mark.h"
extern NSString * const ScribbleObjectUserInfoKey;
extern NSString * const MarkObjectUserInfoKey;
extern NSString * const AddToPreviousMarkUserInfoKey;
@interface Scribble : NSObject
{
    @private
    id <Mark> parentMark_;
}
- (void) addMark:(id <Mark>)aMark shouldAddToPreviousMark:(BOOL)shouldAddToPreviousMark;
- (void) removeMark:(id <Mark>)aMark;
@end
