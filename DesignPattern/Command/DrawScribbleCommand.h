//
//  DrawScribbleCommand.h
//  DesignPattern
//
//  Created by jiangqin on 16/7/8.
//  Copyright © 2016年 mopellet. All rights reserved.
//

#import "Command.h"
#import "Scribble.h"
@interface DrawScribbleCommand : Command
{
    @private
    Scribble * scribble_;
    id <Mark> mark_;
    BOOL shouldAddToPreviousMark_;
}
- (void)execute;
- (void)undo;
@end
