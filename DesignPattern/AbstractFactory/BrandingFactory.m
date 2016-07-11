//
//  BrandingFactory.m
//  DesignPattern
//
//  Created by jiangqin on 16/7/5.
//  Copyright © 2016年 mopellet. All rights reserved.
//

#import "BrandingFactory.h"
#import "AcmeBrandingFactory.h"
#import "SierraBrandingFactory.h"
@implementation BrandingFactory
+(BrandingFactory *)factory{
#if defined (USE_ACME)
    return [[AcmeBrandingFactory alloc] init];
#elif defined (USE_SIERRA)
    return [[SierraBrandingFactory alloc] init];
#else
    return nil;
#endif
}


+(BrandingFactory *)factoryWith:(BrandingFactoryType)type{
    BrandingFactory * factory ;
    switch (type) {
        case BrandingFactoryTypeAcme:
            factory =  [[AcmeBrandingFactory alloc] init];
            break;
        case BrandingFactoryTypeSierra:
            factory = [[SierraBrandingFactory alloc] init];
            break;
        default:
            factory = nil;
            break;
    }
    return factory;
}

-(UIView *)brandedView{
    return nil;
}

- (UIButton *)brandedMainButton{
    return nil;
}

- (UIToolbar *)brandedToolbar{
    return nil;
}

@end
