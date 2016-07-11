//
//  CanvasView.h
//  DesignPattern
//
//  Created by jiangqin on 16/7/5.
//  Copyright © 2016年 mopellet. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Mark.h"
@interface CanvasView : UIView
@property (assign ,nonatomic) id <Mark> mark;

@end
