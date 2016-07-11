//
//  ImageTransformFilter.m
//  DesignPattern
//
//  Created by jiangqin on 16/7/7.
//  Copyright © 2016年 mopellet. All rights reserved.
//

#import "ImageTransformFilter.h"

@implementation ImageTransformFilter

- (id)initWithImageComponent:(id<ImageComponent>)component transform:(CGAffineTransform)transforml{
    if (self = [super initWithImageComponent:component]) {
        [self setTransform:transforml];
    }
    return  self;
}

-(void)apply{
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    //设置变换
    CGContextConcatCTM(context, _transform);
}
@end
