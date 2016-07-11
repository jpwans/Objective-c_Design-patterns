//
//  MarkEnumerator+Private.h
//  DesignPattern
//
//  Created by jiangqin on 16/7/7.
//  Copyright © 2016年 mopellet. All rights reserved.
//

#import "MarkEnumerator.h"

@interface MarkEnumerator (Private)

- (id) initWithMark:(id <Mark>)mark;
- (void) traverseAndBuildStackWithMark:(id <Mark>) mark;
@end
