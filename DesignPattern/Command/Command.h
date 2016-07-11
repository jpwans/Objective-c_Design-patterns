//
//  Command.h
//  DesignPattern
//
//  Created by jiangqin on 16/7/8.
//  Copyright © 2016年 mopellet. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Command : NSObject{
    @protected
    NSDictionary * userInfo_;
}
@property (strong ,nonatomic) NSDictionary * userInfo;

- (void) execute;
- (void) undo;
@end
