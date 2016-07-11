//
//  UIImage+Transform.m
//  DesignPattern
//
//  Created by jiangqin on 16/7/7.
//  Copyright © 2016年 mopellet. All rights reserved.
//

#import "UIImage+Transform.h"
#import "UIImage+BaseFilter.h"
@implementation UIImage (Transform)

- (UIImage *) imageWithTransform:(CGAffineTransform)transform{
    CGContextRef context = [self beginContext];
    // 设置变量
    CGContextConcatCTM(context, transform);
    
    //
    UIImage * imageOut = [self getImageFromCurrentImageContext];
    [self endContext];
    
    return imageOut;
}


@end
