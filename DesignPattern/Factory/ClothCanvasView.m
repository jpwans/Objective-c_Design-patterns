//
//  ClothCanvasView.m
//  DesignPattern
//
//  Created by jiangqin on 16/7/5.
//  Copyright © 2016年 mopellet. All rights reserved.
//

#import "ClothCanvasView.h"

@implementation ClothCanvasView
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        UIImage * backgroundImage = [UIImage imageNamed:@"cloth"];
        UIImageView * backgroundView = [[UIImageView alloc] initWithImage:backgroundImage];
        [self addSubview:backgroundView];
    }
    return self;
}
@end
