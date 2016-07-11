//
//  UIImage+BaseFilter.h
//  DesignPattern
//
//  Created by jiangqin on 16/7/7.
//  Copyright © 2016年 mopellet. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (BaseFilter)

- (CGContextRef) beginContext;

- (UIImage *) getImageFromCurrentImageContext;

- (void) endContext;
@end
