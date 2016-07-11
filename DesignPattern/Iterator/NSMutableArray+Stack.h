//
//  NSMutableArray+Stack.h
//  DesignPattern
//
//  Created by jiangqin on 16/7/7.
//  Copyright © 2016年 mopellet. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSMutableArray (Stack)
- (void) push:(id)object;

- (id) pop;
@end
