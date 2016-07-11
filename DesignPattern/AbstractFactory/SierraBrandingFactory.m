//
//  SierraBrandingFactory.m
//  DesignPattern
//
//  Created by jiangqin on 16/7/5.
//  Copyright © 2016年 mopellet. All rights reserved.
//

#import "SierraBrandingFactory.h"
#import "SierraView.h"
#import "SierraMainButton.h"
#import "SierraToolbar.h"
@implementation SierraBrandingFactory

- (UIView *)brandedView{
    return [[SierraView alloc] init];
}

- (UIButton *)brandedMainButton{
    return [[SierraMainButton alloc] init];
}

- (UIToolbar *)brandedToolbar{
    return [[SierraToolbar alloc] init];
}

@end
