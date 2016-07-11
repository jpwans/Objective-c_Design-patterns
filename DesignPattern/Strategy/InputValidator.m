//
//  InputValidator.m
//  DesignPattern
//
//  Created by jiangqin on 16/7/8.
//  Copyright © 2016年 mopellet. All rights reserved.
//

#import "InputValidator.h"

@implementation InputValidator

-(BOOL)validateInput:(UITextField *)input error:(NSError *__autoreleasing *)error{
    if (error) {
        *error = nil;
    }
    return NO;
}



@end
