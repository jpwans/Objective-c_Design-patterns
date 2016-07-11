//
//  SetStrokeColorCommand.h
//  DesignPattern
//
//  Created by jiangqin on 16/7/5.
//  Copyright © 2016年 mopellet. All rights reserved.
//

#import "Command.h"
#import <UIKit/UIKit.h>
@class SetStrokeColorCommand;
@protocol SetStrokeColorCommandDelegate <NSObject>
- (void) command:(SetStrokeColorCommand *)command
                didRequestColorComponentsForRed:(CGFloat *) red
                                          green:(CGFloat *) green
                                          blue: (CGFloat *) blue;

- (void) command:(SetStrokeColorCommand *)command
                didFinishColorUpdateWithColor:(UIColor *) color;
@end

typedef void (^RGBValuesProvider)(CGFloat * red ,CGFloat * green ,CGFloat * blue);

@interface SetStrokeColorCommand : Command
@property (assign , nonatomic) id <SetStrokeColorCommandDelegate> delegate;
@property (nonatomic ,copy) RGBValuesProvider RGBValuesProvider;
- (void)execute;
@end
