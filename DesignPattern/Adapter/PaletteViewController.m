//
//  PaletteViewController.m
//  DesignPattern
//
//  Created by jiangqin on 16/7/5.
//  Copyright © 2016年 mopellet. All rights reserved.
//

#import "PaletteViewController.h"
#import "SetStrokeColorCommand.h"
#import "CommandSlider.h"
@interface PaletteViewController()<SetStrokeColorCommandDelegate>
@property (strong ,nonatomic) CommandSlider * redSlider;
@property (strong ,nonatomic) CommandSlider * greenSlider;
@property (strong ,nonatomic) CommandSlider * blueSlider;
@end
@implementation PaletteViewController

-(void)viewDidLoad{
    [super viewDidLoad];
    SetStrokeColorCommand * colorCommand;
    
    // 得到用于改变颜色的命令的引用。。。。
    
    [colorCommand setRGBValuesProvider:^(CGFloat * red, CGFloat * green ,CGFloat * blue){
        *red = [_redSlider value];
        *green = [_greenSlider value];
        *blue = [_blueSlider value];
    }];
}

- (void)command:(SetStrokeColorCommand *)command didRequestColorComponentsForRed:(CGFloat *)red green:(CGFloat *)green blue:(CGFloat *)blue
{
    *red = [_redSlider value];
    *green = [_greenSlider value];
    *blue = [_blueSlider value];
}

- (void)command:(SetStrokeColorCommand *)command didFinishColorUpdateWithColor:(UIColor *)color{
    [self.view setBackgroundColor:color];
}

- (IBAction) onCommandSliderValueChanged:(CommandSlider * )sender{
    [[sender command] execute];
}
@end
