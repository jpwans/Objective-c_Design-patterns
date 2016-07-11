//
//  BrandingFactory.h
//  DesignPattern
//
//  Created by jiangqin on 16/7/5.
//  Copyright © 2016年 mopellet. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

typedef  NS_ENUM(NSInteger, BrandingFactoryType){
    BrandingFactoryTypeAcme,
    BrandingFactoryTypeSierra,
};

@interface BrandingFactory : NSObject
+ (BrandingFactory *) factory;
+ (BrandingFactory *) factoryWith:(BrandingFactoryType)type;
- (UIView *) brandedView;
- (UIButton *) brandedMainButton;
- (UIToolbar *) brandedToolbar;

@end
