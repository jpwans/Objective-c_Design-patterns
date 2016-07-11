//
//  GameBoyEmulator.h
//  DesignPattern
//
//  Created by jiangqin on 16/7/6.
//  Copyright © 2016年 mopellet. All rights reserved.
//

#import "ConsoleEmulator.h"

@interface GameBoyEmulator : ConsoleEmulator
//从抽象重载的行为

-(void)loadInstructionsForCommand:(ConsoleCommand)command;
- (void)executeInstructions;
@end
