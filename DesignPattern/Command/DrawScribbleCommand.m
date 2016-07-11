//
//  DrawScribbleCommand.m
//  DesignPattern
//
//  Created by jiangqin on 16/7/8.
//  Copyright © 2016年 mopellet. All rights reserved.
//

#import "DrawScribbleCommand.h"

@implementation DrawScribbleCommand

-(void)execute{
    if (!_userInfo) return;
    
    scribble_ = [userInfo_ objectForKey:@""];
    mark_ = [userInfo_ objectForKey:@""];
    shouldAddToPreviousMark_ = [(NSNumber *)[userInfo_ objectForKey:@""] boolValue];
    
    [scribble_ addMark:mark_ shouldAddToPreviousMark:shouldAddToPreviousMark_];
    
}

- (void)undo{{
    [scribble_ removeMark:mark_];
}
    

@end
