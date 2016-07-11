//
//  MarkEnumerator.h
//  DesignPattern
//
//  Created by jiangqin on 16/7/7.
//  Copyright © 2016年 mopellet. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Mark.h"
@interface MarkEnumerator : NSEnumerator
- (NSArray *)allObjects;
- (id)nextObject;
@end
