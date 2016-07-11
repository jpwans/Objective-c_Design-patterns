//
//  ScribbleThumbnailViewImageProxy.h
//  DesignPattern
//
//  Created by jiangqin on 16/7/11.
//  Copyright © 2016年 mopellet. All rights reserved.
//

#import "ScribbleThumbnailView.h"

@interface ScribbleThumbnailViewImageProxy : ScribbleThumbnailView
{
    @private
    UIImage * realImage;
    BOOL loadingThreadHasLaunched_;
}

@end
