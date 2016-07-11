//
//  SierraBrandingFactory.h
//  DesignPattern
//
//  Created by jiangqin on 16/7/5.
//  Copyright © 2016年 mopellet. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BrandingFactory.h"
@interface SierraBrandingFactory : BrandingFactory
- (UIView *)brandedView;
- (UIButton *)brandedMainButton;
- (UIToolbar *)brandedToolbar;
@end
