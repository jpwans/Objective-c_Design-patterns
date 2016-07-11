//
//  DecoratorViewController.m
//  DesignPattern
//
//  Created by jiangqin on 16/7/7.
//  Copyright © 2016年 mopellet. All rights reserved.
//

#import "DecoratorViewController.h"
#import "UIImage+ImageComponent.h"
#import "ImageShadowFilter.h"
#import "ImageTransformFilter.h"
#import "DecoratorView.h"
#import "UIImage+Transform.h"
#import "UIImage+Shadow.m"
@implementation DecoratorViewController
-(void)viewDidLoad{
    [super viewDidLoad];
    UIImage * image = [UIImage imageNamed:@"game"];
    CGAffineTransform rotateTransform = CGAffineTransformMakeRotation(-M_PI/4.0);
    CGAffineTransform translateTransform = CGAffineTransformMakeTranslation(-image.size.width/2.0, image.size.height/8.0);
    CGAffineTransform finalTransform = CGAffineTransformConcat(rotateTransform, translateTransform);
    
    //真正的子集方式
    id <ImageComponent> transformedImage = [[ImageTransformFilter alloc] initWithImageComponent:image transform:finalTransform];
    
    id <ImageComponent> finalImage = [[ImageShadowFilter alloc] initWithImageComponent:transformedImage];
    
    //用滤镜处理过的图像
    DecoratorView * decoratorView =[[DecoratorView alloc] initWithFrame:self.view.bounds];
    [decoratorView setImage:finalImage];
    [self.view addSubview:decoratorView];
    
    
  
    // 分类方式家滤镜
//     transformedImage = [image imageWithTransform:finalTransform];
//    
//    finalImage = [(UIImage *)transformedImage imageWithDropShadow];
//    
//
    
}
@end
