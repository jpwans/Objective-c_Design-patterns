//
//  NSMutableArray+Stack.m
//  DesignPattern
//
//  Created by jiangqin on 16/7/7.
//  Copyright © 2016年 mopellet. All rights reserved.
//

#import "NSMutableArray+Stack.h"

@implementation NSMutableArray (Stack)

- (void) push:(id)object{
    [self addObject:object];
}

- (id) pop{
    if ([self count] == 0 ) return nil;
    
    id object = [self lastObject];
    [self removeLastObject];
    return object;
}
@end
