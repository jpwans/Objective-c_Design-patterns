//
//  ImageTransformFilter.h
//  DesignPattern
//
//  Created by jiangqin on 16/7/7.
//  Copyright © 2016年 mopellet. All rights reserved.
//

#import "ImageFilter.h"

@interface ImageTransformFilter : ImageFilter

@property (nonatomic ,assign) CGAffineTransform transform;

- (id) initWithImageComponent:(id<ImageComponent>)component
                    transform:(CGAffineTransform)transforml;

- (void) apply;
@end
