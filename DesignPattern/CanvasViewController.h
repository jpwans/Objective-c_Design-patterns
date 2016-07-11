//
//  CanvasViewController.h
//  DesignPattern
//
//  Created by jiangqin on 16/7/5.
//  Copyright © 2016年 mopellet. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CanvasView.h"
#import "CanvasViewGenerator.h"

#import "Scribble.h"
@interface CanvasViewController : UIViewController

@property (nonatomic ,strong) CanvasView * canvasView;
@property (strong, nonatomic) Scribble * scribble;
@property (strong, nonatomic) UIColor * strokeColor;
@property (assign ,nonatomic) CGFloat strokeSize;

- (void) loadCanvasViewWithGenerator:(CanvasViewGenerator *)generator;
@end
