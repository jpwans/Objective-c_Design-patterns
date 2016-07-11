//
//  CustomTextField.m
//  DesignPattern
//
//  Created by jiangqin on 16/7/8.
//  Copyright © 2016年 mopellet. All rights reserved.
//

#import "CustomTextField.h"

@implementation CustomTextField


- (BOOL)validate{
    NSError * error = nil;
    BOOL validationResult = [_inputValidator validateInput:self error:&error];
    
    if (!validationResult) {
        UIAlertView * alertView = [[UIAlertView alloc] initWithTitle:[error localizedDescription] message:[error localizedFailureReason] delegate:nil cancelButtonTitle:NSLocalizedString(@"ok", @"") otherButtonTitles:nil, nil];
        [alertView show];
    }
    return validationResult;
}


@end

