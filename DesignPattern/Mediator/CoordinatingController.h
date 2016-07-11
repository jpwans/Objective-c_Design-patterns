//
//  CoordinatingController.h
//  DesignPattern
//
//  Created by jiangqin on 16/7/6.
//  Copyright © 2016年 mopellet. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PaletteViewController.h"
#import "ThumbnailViewController.h"
#import "CanvasViewController.h"
@interface CoordinatingController : NSObject

@property (nonatomic ,readonly) UIViewController * activeViewController;
@property (nonatomic ,readonly) CanvasViewController * canvasViewController;

+ (CoordinatingController *) sharedInstance;
- (IBAction) requestViewChangeByObject:(id)object;
@end
