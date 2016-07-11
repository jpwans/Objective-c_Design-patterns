
//
//  UIImage+BaseFilter.m
//  DesignPattern
//
//  Created by jiangqin on 16/7/7.
//  Copyright © 2016年 mopellet. All rights reserved.
//

#import "UIImage+BaseFilter.h"

@implementation UIImage (BaseFilter)

- (CGContextRef)beginContext{
    CGSize size = [self size];
    
//    if
        UIGraphicsBeginImageContextWithOptions(size, NO, 0);
//    else
        UIGraphicsBeginImageContext(size);
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    return context;
}

- (UIImage *) getImageFromCurrentImageContext{
    [self drawAtPoint:CGPointZero];
    
    UIImage *imageOut = UIGraphicsGetImageFromCurrentImageContext();
    return imageOut;
}

- (void) endContext{
    UIGraphicsEndImageContext();
}
@end

