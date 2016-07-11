//
//  ScribbleMemento.h
//  DesignPattern
//
//  Created by jiangqin on 16/7/11.
//  Copyright © 2016年 mopellet. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "Mark.h"
@interface ScribbleMemento : NSObject
{
    @private
    id <Mark> mark_;
    BOOL hasCompleteSnapshot_;
}

+ (ScribbleMemento *) mementoWithData:(NSData *) data;

- (NSData *) data;

@end
