//
//  ScribbleMemento+Friend.h
//  DesignPattern
//
//  Created by jiangqin on 16/7/11.
//  Copyright © 2016年 mopellet. All rights reserved.
//

#import "ScribbleMemento.h"

@interface ScribbleMemento (Friend)
@end

@interface ScribbleMemento ()
- (id) initWithMark:(id<Mark>)aMark;

@property (nonatomic, copy) id <Mark> mark;
@property (nonatomic, assign) BOOL hasCompleteSnapshot;
@end
