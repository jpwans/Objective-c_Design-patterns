//
//  CommandSlider.h
//  DesignPattern
//
//  Created by jiangqin on 16/7/5.
//  Copyright © 2016年 mopellet. All rights reserved.
//

#import <UIKit/UIKit.h>
//#import "Command.h"
#import "SetStrokeColorCommand.h"
@interface CommandSlider : UISlider

//@property (strong ,nonatomic) Command * command;
@property (strong ,nonatomic) SetStrokeColorCommand * command;
@end
