

//
//  ScribbleThumbnailViewImageProxy.m
//  DesignPattern
//
//  Created by jiangqin on 16/7/11.
//  Copyright © 2016年 mopellet. All rights reserved.
//

#import "ScribbleThumbnailViewImageProxy.h"

@interface ScribbleThumbnailViewImageProxy()

- (void) forwardImageLoadingThread;
@end

@implementation ScribbleThumbnailViewImageProxy
@dynamic imagePath;


// 如果不需要把图像显示在视图上，客户端可以直接使用这个方法来转发真实图像的加载

- (UIImage *) image;
{
    if (realImage == nil) {
        realImage = [[UIImage alloc] initWithContentsOfFile:self.imagePath];
    }
    return realImage;
}


#pragma mark -
#pragma mark A private method for an image forward loading thread
- (void)forwardImageLoadingThread{
//    NSAuto
    
    //转发实际加载的
    [self image];
    
    // 使用刚加载的图像进行重画
    [self performSelectorInBackground:@selector(setNeedsDisplay) withObject:nil];
    
}

// 在不同的线程会建立转发调用， 从真实的图像加载实际内容
// 在实际内返回以前，drawRect: 会处理后台的加载过程，并绘制一个占位框
// 一旦实际内容加载完成,就会用实际内容进行重画

- (void)drawRect:(CGRect)rect{
    
    // 如果realImageView 中没有真实图像
    // 就会绘制一张空白图像框，作为占位图像
    if (realImage == nil) {
        CGContextRef context = UIGraphicsGetCurrentContext();
        
        // 使用虚线绘制占位框
        // 虚线的画线长度为10个用户空间单位
        // 画线之间的间隙为3个用户空间单位
        CGContextSetLineWidth(context, 10);
        const CGFloat dashLengths[2] = {10,3};
        CGContextSetLineDash(context, 3, dashLengths, 2);
        CGContextSetStrokeColorWithColor(context, [UIColor darkGrayColor].CGColor);
        CGContextSetFillColorWithColor(context, [UIColor lightGrayColor].CGColor);
        CGContextAddRect(context, rect);
        CGContextDrawPath(context, kCGPathFillStroke);
        
         // 如果还没有加载到实际的内容
        // 就启动一个线程进行加载
        
        if (!loadingThreadHasLaunched_) {
            [self performSelectorInBackground:@selector(forwardImageLoadingThread) withObject:nil];
            loadingThreadHasLaunched_ = YES;
        }
    }
    // 否则就向realImage 传递draw 消息让它去画
    else{
        [realImage drawInRect:rect];
    }
}

@end
