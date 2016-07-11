//
//  CanvasViewController.m
//  DesignPattern
//
//  Created by jiangqin on 16/7/5.
//  Copyright © 2016年 mopellet. All rights reserved.
//

#import "CanvasViewController.h"
#import "Dot.h"
#import "Stroke.h"

@interface CanvasViewController ()
{
    CGPoint startPoint;
//    UIColor * stokeColor;
//    CGFloat strokeSize;
}
@end
@implementation CanvasViewController

- (void)viewDidLoad{
    [super viewDidLoad];
    CanvasViewGenerator * defaultGenerator = [[CanvasViewGenerator alloc] init];
    [self loadCanvasViewWithGenerator:defaultGenerator];
    
    
    
    
    Scribble * scribble = [[Scribble alloc] init];
    [self setScribble:scribble];
}

#pragma mark - 
#pragma mark Loading a CanvasView from a CanvasViewGenerator

- (void)loadCanvasViewWithGenerator:(CanvasViewGenerator *)generator{
    [_canvasView removeFromSuperview];
    CGRect aFrame = CGRectMake(0, 0, 320, 436);
    CanvasView * aCanvasView = [generator canvasViewWithFrame:aFrame];
    self.canvasView = aCanvasView;
    [self.view addSubview:_canvasView];
}


-(void)setScribble:(Scribble *)scribble{
    if (_scribble != scribble) {
        _scribble = scribble;
        
        [_scribble addObserver:self forKeyPath:@"mark" options:NSKeyValueObservingOptionInitial|NSKeyValueObservingOptionNew context:nil];
    }
}

- (void) touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
   startPoint =  [[touches anyObject] locationInView:_canvasView];
    [super touchesBegan:touches withEvent:event];
}

-(void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    CGPoint lastPoint = [[touches anyObject] previousLocationInView:_canvasView];
    
    //如果这是手指的拖动，就向涂鸦添加一个线条
    if(CGPointEqualToPoint(lastPoint, startPoint)){
        id <Mark> newStroke = [[Stroke alloc] init];
        [newStroke setColor:_strokeColor];
        [newStroke setSize:_strokeSize];
        [_scribble addMark:newStroke shouldAddToPreviousMark:NO];
    }
    //把当前触摸作为定点添加到临时线条
    CGPoint thisPoint = [[touches anyObject] locationInView:_canvasView];
    Vertex * vertex = [[Vertex alloc] initWithLocation:thisPoint];
    [_scribble addMark:vertex shouldAddToPreviousMark:YES];
    [super touchesMoved:touches withEvent:event];
}

- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    CGPoint lastPoint = [[touches anyObject] previousLocationInView:_canvasView];
    CGPoint thisPoint = [[touches anyObject] locationInView:_canvasView];
    
    // 如果触摸从未移动（抬起之前一直在同一处）
    //就向现有的Stroke添加一个点
    // 否则就把它作为最后一个顶点添加到临时线条
    if (CGPointEqualToPoint(lastPoint, thisPoint)) {
        Dot * singleDot = [[Dot alloc] initWithLocation:thisPoint];
        [singleDot setColor:_strokeSize];
        [singleDot setSize:_strokeColor];
        
        [_scribble addMark:singleDot shouldAddToPreviousMark:NO];
    }
    //在此重置起点
    startPoint = CGPointZero;
    // 如果这是线条的最后一条就不用画它
    
    [super touchesEnded:touches withEvent:event];
}


-(void)touchesCancelled:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    startPoint = CGPointZero;
    [super touchesCancelled:touches withEvent:event];
}



#pragma mark - 
#pragma mark Scribble observer method

- (void) observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSString *,id> *)change context:(void *)context{
    if ([object isKindOfClass:[Scribble class]] && [keyPath isEqualToString:@"mark"]) {
        id <Mark> mark = [change objectForKey:NSKeyValueChangeNewKey];
        [_canvasVie setMark:mark];
        [_canvasView setNeedsDisplay];
    }
}








@end
