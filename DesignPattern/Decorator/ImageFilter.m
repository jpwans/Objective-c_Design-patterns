//
//  ImageFilter.m
//  DesignPattern
//
//  Created by jiangqin on 16/7/7.
//  Copyright © 2016年 mopellet. All rights reserved.
//

#import "ImageFilter.h"

@implementation ImageFilter

-(id)initWithImageComponent:(id<ImageComponent>)component{
    if (self = [super init] ) {
        [self setComponent:component];
    }
    return self;
}

- (void) apply{
    //子类重载
}

- (id)forwardingTargetForSelector:(SEL)aSelector{
    NSString * selectorName = NSStringFromSelector(aSelector);
    if ([selectorName hasPrefix:@"draw"]) {
        [self apply];
    }
    return _component;
}
@end
