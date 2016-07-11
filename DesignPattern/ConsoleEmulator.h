//
//  ConsoleEmulator.h
//  DesignPattern
//
//  Created by jiangqin on 16/7/6.
//  Copyright © 2016年 mopellet. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ConsoleCommands.h"
@interface ConsoleEmulator : NSObject

- (void) loadInstructionsForCommand:(ConsoleCommand ) command;

- (void) executeInstructions;

// 其他行为与属性


@end
