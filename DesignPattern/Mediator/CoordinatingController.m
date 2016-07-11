//
//  CoordinatingController.m
//  DesignPattern
//
//  Created by jiangqin on 16/7/6.
//  Copyright © 2016年 mopellet. All rights reserved.
//

#import "CoordinatingController.h"

typedef NS_ENUM(NSInteger ,ButtonTag){
    kButtonTagDone,
    kButtonTagOpenPaletterView;
    kButtonTagOpenThumbnailView,
} ;

@implementation CoordinatingController
+(CoordinatingController *)sharedInstance
{
    static CoordinatingController * controller = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        controller = [[[self class] alloc] init];
    });
}

- (IBAction) requestViewChangeByObject:(id)object{
    if ([object isKindOfClass:[UIBarButtonItem class]]) {
        switch ([(UIBarButtonItem *)object tag]) {
            case kButtonTagOpenPaletterView:
            {
                PaletteViewController * controller = [[PaletteViewController alloc] init];
                [_canvasViewController presentViewController:controller animated:YES completion:nil];
                self.activeViewController = controller;
            }
                break;
            case kButtonTagOpenThumbnailView:
            {
                ThumbnailViewController * controller = [[ThumbnailViewController alloc] init];
                [_canvasViewController presentViewController:controller animated:YES completion:nil];
                self.activeViewController = controller;
            }
                break;
            default:
            {
                [_canvasViewController dismissViewControllerAnimated:YES completion:nil];
                self.activeViewController = _canvasViewController;
            }
                break;
        }
    }
    else{
        [_canvasViewController dismissViewControllerAnimated:YES completion:nil];
        self.activeViewController = _canvasViewController;
    }
}
@end
