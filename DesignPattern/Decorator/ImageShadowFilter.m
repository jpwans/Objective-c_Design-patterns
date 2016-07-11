//
//  ImageShadowFilter.m
//  DesignPattern
//
//  Created by jiangqin on 16/7/7.
//  Copyright © 2016年 mopellet. All rights reserved.
//

#import "ImageShadowFilter.h"

@implementation ImageShadowFilter









-(void)apply{
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    //设置阴影效果
    CGSize offset = CGSizeMake(-25, 15);
    CGContextSetShadow(context, offset, 20.0);
}
@end
