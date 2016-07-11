//
//  TouchConsoleController.m
//  DesignPattern
//
//  Created by jiangqin on 16/7/6.
//  Copyright © 2016年 mopellet. All rights reserved.
//

#import "TouchConsoleController.h"
//#import "ConsoleEmulator.h"
#import "GameBoyEmulator.h"
@implementation TouchConsoleController

//- (instancetype)init
//{
//    self = [super init];
//    if (self) {
//        super.emulator = [[GameBoyEmulator alloc] init];
//    }
//    return self;
//}

-(void)up{
    [super setCommand:kConsoleCommandUp];
}

- (void)down{
    [super setCommand:kConsoleCommandDown];
}

- (void)left{
    [super setCommand:kConsoleCommandLeft];
}

- (void)right{
    [super setCommand:kConsoleCommandRight];
}

- (void)select{
    [super setCommand:kConsoleCommandSelect];
}

- (void)start{
    [super setCommand:kConsoleCommandStart];
}

- (void)action1{
    [super setCommand:kConsoleCommandAction1];
}

- (void)action2{
    [super setCommand:kConsoleCommandAction2];
}

@end
