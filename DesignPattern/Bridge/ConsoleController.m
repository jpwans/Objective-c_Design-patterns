//
//  ConsoleController.m
//  DesignPattern
//
//  Created by jiangqin on 16/7/6.
//  Copyright © 2016年 mopellet. All rights reserved.
//

#import "ConsoleController.h"

@implementation ConsoleController

-(void)setCommand:(ConsoleCommand)command{
    [_emulator loadInstructionsForCommand:command];
    [_emulator executeInstructions];
}

@end
