
//
//  UIImage+Shadow.m
//  DesignPattern
//
//  Created by jiangqin on 16/7/7.
//  Copyright © 2016年 mopellet. All rights reserved.
//

#import "UIImage+Shadow.h"
#import "UIImage+BaseFilter.h"
@implementation UIImage (Shadow)

- (UIImage *)imageWithDropShadow{
    CGContextRef context = [self beginContext];
    
    CGSize offset = CGSizeMake(-25, 15);
    CGContextSetShadow(context, offset, 20.0);
    
    //向上下文绘制原始图像
    UIImage * imageOut = [self getImageFromCurrentImageContext];
    
    [self endContext];
    
    return imageOut;
}
@end
