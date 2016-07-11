//
//  DecoratorView.m
//  DesignPattern
//
//  Created by jiangqin on 16/7/7.
//  Copyright © 2016年 mopellet. All rights reserved.
//

#import "DecoratorView.h"

@implementation DecoratorView

- (void)drawRect:(CGRect)rect{
    [self.image drawInRect:rect];
}

@end
