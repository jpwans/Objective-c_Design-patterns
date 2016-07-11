//
//  Singleton.m
//  DesignPattern
//
//  Created by jiangqin on 16/7/5.
//  Copyright © 2016年 mopellet. All rights reserved.
//

#import "Singleton.h"
#import <UIKit/UIKit.h>

@implementation Singleton
+ (instancetype)sharedSingleton{
    static Singleton * singleton = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        singleton = [[[self class] alloc] init];
    });
    return singleton;
}
+ (void)_{
    //常用单利
//    [UIApplication sharedApplication];
//    [UIAccelerometer sharedAccelerometer];
//    [NSFileManager defaultManager];
//    [NSUserDefaults standardUserDefaults];
}
@end
