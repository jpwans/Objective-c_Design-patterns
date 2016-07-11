//
//  AnySandwich.m
//  DesignPattern
//
//  Created by jiangqin on 16/7/8.
//  Copyright © 2016年 mopellet. All rights reserved.
//

#import "AnySandwich.h"

@implementation AnySandwich

- (void)make{
    [self prepareBread];
    [self putBreadOnPlate];
    [self addMeat];
    [self addCondiments];
    [self extraStep];
    [self serve];
}


- (void) putBreadOnPlate{
        // 做任何三明治都要先把面包放在盘子上
}

- (void)serve{
    // 任何三明治做好了都要上餐
}

#pragma mark -
#pragma mark - Details will be handled by subclasses


- (void)prepareBread{
    // 要保证之类重载这个方法
    [NSException raise:NSInternalInconsistencyException format:@"You must override%@in a subclass",NSStringFromSelector(_cmd)];
}

- (void)addMeat{
    // the same as above
    [NSException raise:NSInternalInconsistencyException format:@"You must override%@in a subclass",NSStringFromSelector(_cmd)];
}

- (void)addCondiments{
    // the same as above
    [NSException raise:NSInternalInconsistencyException format:@"You must override%@in a subclass",NSStringFromSelector(_cmd)];
    
//    @throw [NSException exceptionWithName:... reason:... userInfo:...];
}

- (void)extraStep{

}

@end
