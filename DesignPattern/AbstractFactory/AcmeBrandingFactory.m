//
//  AcmeBrandingFactory.m
//  DesignPattern
//
//  Created by jiangqin on 16/7/5.
//  Copyright © 2016年 mopellet. All rights reserved.
//

#import "AcmeBrandingFactory.h"
#import "AcmeView.h"
#import "AcmeMainButton.h"
#import "AcmeToolbar.h"
@implementation AcmeBrandingFactory

- (UIView *)brandedView{
    return [[AcmeView alloc] init];
}

- (UIButton *)brandedMainButton{
    return [[AcmeMainButton alloc] init];
}

- (UIToolbar *)brandedToolbar{
    return [[AcmeToolbar alloc] init];
}
@end
