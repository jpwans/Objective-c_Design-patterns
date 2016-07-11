
//
//  FlowerFactory.m
//  DesignPattern
//
//  Created by jiangqin on 16/7/11.
//  Copyright © 2016年 mopellet. All rights reserved.
//

#import "FlowerFactory.h"
#import "FlowerView.h"


@implementation FlowerFactory
{
    NSMutableDictionary * flowerPool_;
}

- (UIView *)flowerViewWithType:(FlowerType)type{
    // 懒加载花朵池
    if (flowerPool_ == nil) {
        flowerPool_ = [[NSMutableDictionary alloc] initWithCapacity:kTotalNumberOfFlowerTypes];
    }
    
    //尝试从花朵池中取出一朵花
    UIView * flowerView = [flowerPool_ objectForKey:@(type)];
    
    // 如果请求的类型不存在
    // 那么就创建一个并加入到池里
    
    if (flowerView == nil) {
        UIImage * flowerImage;
        
        switch (type) {
            case kAnemone:
                flowerImage = [UIImage imageNamed:@"game"];
                break;
            case kCosmos:
                flowerImage = [UIImage imageNamed:@"game"];
                break;
            case kGerberas:
                flowerImage = [UIImage imageNamed:@"game"];
                break;
            case kHollyhock:
                flowerImage = [UIImage imageNamed:@"game"];
                break;
            case kJasmine:
                flowerImage = [UIImage imageNamed:@"game"];
                break;
            case kZinnia:
                flowerImage = [UIImage imageNamed:@"game"];
                break;
            default:
                break;
        }
        flowerView = [[UIImageView alloc] initWithImage:flowerImage];
        [flowerPool_ setObject:flowerView forKey:@(type)];
    }
    return flowerView;
}
@end
