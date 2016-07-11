//
//  AnySandwich.h
//  DesignPattern
//
//  Created by jiangqin on 16/7/8.
//  Copyright © 2016年 mopellet. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AnySandwich : NSObject

- (void) make;

- (void) prepareBread;
- (void) putBreadOnPlate;
- (void) addMeat;
- (void) addCondiments;
- (void) extraStep;
- (void) serve;

@end
