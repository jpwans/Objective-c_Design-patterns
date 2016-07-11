//
//  FlowerFactory.h
//  DesignPattern
//
//  Created by jiangqin on 16/7/11.
//  Copyright © 2016年 mopellet. All rights reserved.
//

#import <Foundation/Foundation.h>

#import <UIKit/UIKit.h>
#import "FlowerView.h"

typedef NS_ENUM(NSInteger,FlowerType){
    kAnemone,
    kCosmos,
    kGerberas,
    kHollyhock,
    kJasmine,
    kZinnia,
    kTotalNumberOfFlowerTypes,
};

typedef struct{
    __unsafe_unretained  UIView * flowerView;
    CGRect area;
} ExtrinsicFlowerState;


@interface FlowerFactory : NSObject{

}


- (UIView *) flowerViewWithType:(FlowerType )type;

@end
