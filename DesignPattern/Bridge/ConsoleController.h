//
//  ConsoleController.h
//  DesignPattern
//
//  Created by jiangqin on 16/7/6.
//  Copyright © 2016年 mopellet. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ConsoleCommands.h"
#import "ConsoleEmulator.h"
@interface ConsoleController : NSObject

@property (strong ,nonatomic) ConsoleEmulator * emulator;

- (void) setCommand:(ConsoleCommand) command;

@end
