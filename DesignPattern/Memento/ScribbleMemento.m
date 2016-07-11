//
//  ScribbleMemento.m
//  DesignPattern
//
//  Created by jiangqin on 16/7/11.
//  Copyright © 2016年 mopellet. All rights reserved.
//

#import "ScribbleMemento.h"
#import "ScribbleMemento+Friend.h"
@implementation ScribbleMemento

- (NSData *)data {
    NSData * data = [NSKeyedArchiver archivedDataWithRootObject:mark_];
    return data;
}

+ (ScribbleMemento *)mementoWithData:(NSData *)data{
    // 如果data不上有效文档就引发异常
    id <Mark> retoredMark = (id <Mark>)
    [NSKeyedUnarchiver unarchiveObjectWithData:data];
    ScribbleMemento * memento = [[ScribbleMemento alloc] initWithMark:retoredMark];
    return memento;
}

- (id)initWithMark:(id<Mark>)aMark{
    if (self == [super init]) {
        [self setMark:aMark];
    }
    return self;
}
@end
