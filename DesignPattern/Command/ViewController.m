//
//  ViewController.m
//  Command
//
//  Created by jiangqin on 16/7/8.
//  Copyright © 2016年 mopellet. All rights reserved.
//

#import "ViewController.h"
#import "Scribble.h"
#import "CanvasView.h"
#import "Stroke.h"
#import "Vertex.h"
#import "Dot.h"
#import "Command.h"
#import "DrawScribbleCommand.h"
#import "NSMutableArray+Stack.h"

static NSInteger const levelsOfUndo_ = 6 ;

@interface ViewController ()
{
    NSMutableArray * undoStack_;
    NSMutableArray * redoStack_;
}
@property (strong ,nonatomic) Scribble * scribble;
@property (assign ,nonatomic) CGPoint startPoint;
@property (strong ,nonatomic) CanvasView * canvasView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //命令
    // Do any additional setup after loading the view, typically from a nib.
    //1.请求封装成一个对象
    /*
     *  支持撤销和恢复
     * 想用对象参数化一个动作以执行操作，并用不同的命令对象来代替回调函数
     * 想要在不同的时刻对请求进行制定，排列和执行
     * 想记录修改日志，这样在系统故障时。这些修改可再后来重做一遍。
     * 想让系统支持事物，事物封装了对数据的一系列修改，事务可以建模为命令对象
     *
     */
    
//    NSInvocation
//    NSUndoManager
    
}

- (NSInvocation) drawScribbleInvocation{
    NSMethodSignature * executeMethodSignature = [_scribble methodSignatureForSelector:@selector(addMark:shouldAddToPreviousMark:)];
    NSInvocation * drawInvocation = [NSInvocation invocationWithMethodSignature:executeMethodSignature];
    
    [drawInvocation setTarget:_scribble];
    [drawInvocation setSelector:@selector(addMark:shouldAddToPreviousMark:)];
    BOOL attachToPreviousMark = NO;
    [drawInvocation setArgument:&attachToPreviousMark atIndex:3];
    return drawInvocation;
}



- (NSInvocation *) undrawScribbleInvocation{
    NSMethodSignature * unexecuteMethodSignatrue = [_scribble
                                                    methodSignatureForSelector:
                                                    @selector(removeMark:)];
    
    NSInvocation * undrawInvocation = [NSInvocation invocationWithMethodSignature:unexecuteMethodSignatrue];
    
    [undrawInvocation setTarget:_scribble];
    [undrawInvocation setSelector:@selector(removeMark:)];
    return undrawInvocation;
}


#pragma mark - Draw Scribble Command Methods 

/**
 *
 *  第一个方法接受调用对象的参数，直接执行并把另外一个调用对象注册为撤销操作
 *  @param invocation
 *  @param undoInvocation
 */
- (void) executeInvocation:(NSInvocation *) invocation
        withUndoInvocation:(NSInvocation *) undoInvocation
{
    [invocation retainArguments];
    
    [[self.undoManager prepareWithInvocationTarget:self]
     unexecuteInvocation:undoInvocation withRedoInvocation:invocation];
    
    [invocation invoke];
}


/**
 *
 *  第一个参数的调用对象来执行撤销操作 并把第二个参数注册为恢复操作
 *  @param invocation     <#invocation description#>
 *  @param redoInvocation <#redoInvocation description#>
 */
- (void) unexecuteInvocation:(NSInvocation *) invocation
          withRedoInvocation:(NSInvocation *) redoInvocation
{
    [[self.undoManager prepareWithInvocationTarget:self]
     executeInvocation:redoInvocation withUndoInvocation:invocation];
    
    [invocation invoke];
}


#pragma mark - 
#pragma mark Touch Event Handlers

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    _startPoint = [[touches anyObject] locationInView:_canvasView];
}

-(void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    CGPoint lastPoint = [[touches anyObject] preciseLocationInView:_canvasView];
    
    
    //如果手指的拖动 就向涂鸦添加一个线条
    if (CGPointEqualToPoint(lastPoint, _startPoint)) {
        id <Mark> newStroke = [[Stroke alloc] init];
        
//        newStroke setColor:<#(UIColor *)#>
//        newStroke setSize:<#(CGFloat)#>
//        _scribble addMark:newStroke shouldAddToPreviousMark:NO -----删除线
        {
            NSDictionary * userInfo = @{ScribbleObjectUserInfoKey:_scribble,MarkObjectUserInfoKey:newStroke,AddToPreviousMarkUserInfoKey:@(NO)};
            DrawScribbleCommand * command = [[DrawScribbleCommand alloc] init];
            [command setUserInfo:userInfo];
            [self executeCommand:command prepareForUndo:YES];
        
        }
        
        {
        // 取得用于绘图的NSInvocation
        // 并为绘图命令设置新的参数
        NSInvocation * drawInvocation = [self drawScribbleInvocation];
        [drawInvocation setArgument:&newStroke atIndex:2];
        
        // 取得用于撤销绘图的NSInvocation
        // 并为撤销绘图命令设置新参数
        NSInvocation * undrawInvocation = [self undrawScribbleInvocation];
        [undrawInvocation setArgument:&newStroke atIndex:2];
        
        //执行带有撤销命令的绘图命令
        [self executeInvocation:drawInvocation withUndoInvocation:undrawInvocation];
        }
    }
    
    // 把当前触摸作为定点添加到临时线条
    CGPoint thisPoint = [[touches anyObject] locationInView:_canvasView];
    Vertex * vertex = [[Vertex alloc] initWithLocation:thisPoint];
    
    // 由于不需要撤销每个顶点 ，所以保留这条语句
    [_scribble addMark:vertex shouldAddToPreviousMark:YES];
    // 为了用户体验 撤销的时候不撤销顶点
    
}

- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    CGPoint lastPoint = [[touches anyObject] preciseLocationInView:_canvasView];
    CGPoint thisPoint = [[touches anyObject] locationInView:_canvasView];
    
    // 如果触摸从未移动 （抬起之前一直在同一处）
    // 就向现有Stroke组合体添加一个点
    // 否则就把它作为最后一个顶点添加到临时线条
    if (CGPointEqualToPoint(lastPoint, thisPoint)) {
        Dot * singleDot = [[Dot alloc] initWithLocation:thisPoint];
//        [singleDot ]
        
//        _scribble addMark:<#(id<Mark>)#> shouldAddToPreviousMark:<#(BOOL)#> ----
        
        
        {
            NSDictionary * userInfo = @{ScribbleObjectUserInfoKey : _scribble ,
                                        MarkObjectUserInfoKey : singleDot,
                                        AddToPreviousMarkUserInfoKey : @(NO)};
        
            DrawScribbleCommand * command = [[DrawScribbleCommand alloc] init];
            [command setUserInfo:userInfo];
            [self executeCommand:command prepareForUndo:YES];
        }
        
        {
        //取得用于绘图的NSInvocation
        // 为绘图命令设置新的参数
        NSInvocation * drawInvocation = [self drawScribbleInvocation];
        [drawInvocation setArgument:&singleDot atIndex:2];
        
        // 取得用户撤销绘图的NSInvocation
        // 并未撤销绘图命令设置新的参数
        NSInvocation * undrawInvocation = [self undrawScribbleInvocation];
        [undrawInvocation setArgument:&singleDot atIndex:2];
        
        //执行带有撤销命令的绘图命令
        [self executeInvocation:drawInvocation withUndoInvocation:undrawInvocation];
        }
    }
    _startPoint = CGPointZero;
    // 如果这是线条的最后一点 用不着画它
    // 因为用户看不出什么区别
}

- (void)touchesCancelled:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    _startPoint = CGPointZero;
}





#pragma mark - 
#pragma mark Draw Scribble Command Methods

/**
 *  负责执行传进来的Command对象 ，并把它压入undoStack_ 这个方法也管理undoStack_的大小 
 如果栈满了 就把栈底的元素丢掉
 *
 *  @param command        <#command description#>
 *  @param prepareForUndo <#prepareForUndo description#>
 */
- (void) executeCommand:(Command *)command
         prepareForUndo:(BOOL)prepareForUndo{
    if (prepareForUndo) {
        // 懒加载 undoStack_
        if (undoStack_ == nil) {
            undoStack_  = [[NSMutableArray alloc] initWithCapacity:levelsOfUndo_];
        }
        
        // 如果撤销了， 就丢弃掉栈底的元素
        if ([undoStack_ count] == levelsOfUndo_ ) {
//            undoStack_ dr
        }
        
        // 把命令压入撤销栈
        [undoStack_ push:command];
    }
    
    [command execute];
}


/**
 *  首先从undoStack_的栈顶取出最后一个命令的引用。然后向他发送undo消息 撤销它保存的mark对象 然后 如果 redoStack 
    还没有实例化 就进行实例化  再把刚刚从undoStack_弹出的Command对象压栈
 
 */
- (void) undoCommand {
    Command * command =[undoStack_ pop];
    [command undo];
    
    //把命令压入恢复栈
    
    if (redoStack_ == nil) {
        redoStack_ = [[NSMutableArray alloc] initWithCapacity:levelsOfUndo_];
    }
    [redoStack_ push:command];
}

- (void) redoCommand{
    Command * command = [redoStack_ pop];
    [command execute];
    
    // 把命令压回到撤销栈
    [undoStack_ push:command];
}




#pragma mark - 
#pragma mark Toolbar button hit method 

- (IBAction) onBarButoonHit:(id)sender
{
    UIBarButtonItem * barButton = sender;
    
    if (barButton.tag == 4) {
        [self undoCommand];
        {
            [self.undoManager undo];
        }
    }
    else if(barButton.tag == 5){
        [self redoCommand];
        {
            [self.undoManager redo];
        }
    }
}






@end
