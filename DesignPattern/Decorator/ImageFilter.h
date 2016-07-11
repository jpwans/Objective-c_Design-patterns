//
//  ImageFilter.h
//  DesignPattern
//
//  Created by jiangqin on 16/7/7.
//  Copyright © 2016年 mopellet. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ImageComponent.h"
#import "UIImage+ImageComponent.h"
@interface ImageFilter : NSObject

@property (nonatomic, assign) id <ImageComponent> component;

- (void) apply;
- (id) initWithImageComponent:(id <ImageComponent>) component;
- (id) forwardingTargetForSelector:(SEL)aSelector;
@end
