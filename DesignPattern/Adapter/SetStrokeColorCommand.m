//
//  SetStrokeColorCommand.m
//  DesignPattern
//
//  Created by jiangqin on 16/7/5.
//  Copyright © 2016年 mopellet. All rights reserved.
//

#import "SetStrokeColorCommand.h"

@implementation SetStrokeColorCommand
-(void)execute{
    CGFloat redValue = 0.0;
    CGFloat greenValue = 0.0;
    CGFloat blueValue = 0.0;
    
    //从委托获取RGB的值
//    [_delegate command:self didRequestColorComponentsForRed:&redValue green:&greenValue blue:&blueValue];
    
    if (_RGBValuesProvider !=nil) {
        _RGBValuesProvider(&redValue ,&greenValue ,&blueValue);
    }
    
    UIColor *color = [UIColor colorWithRed:redValue green:greenValue blue:blueValue alpha:1.0f];
    
    //设置一个color 值
    //setclor:color
    
    //转发更新的消息
    [_delegate command:self didFinishColorUpdateWithColor:color];    
}

@end
