//
//  PaperCanvasViewGenerator.h
//  DesignPattern
//
//  Created by jiangqin on 16/7/5.
//  Copyright © 2016年 mopellet. All rights reserved.
//

#import "CanvasViewGenerator.h"
#import "PaperCanvasView.h"
@interface PaperCanvasViewGenerator : CanvasViewGenerator
-(CanvasView *)canvasViewWithFrame:(CGRect)aFrame;
@end
