//
//  InputValidator.h
//  DesignPattern
//
//  Created by jiangqin on 16/7/8.
//  Copyright © 2016年 mopellet. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface InputValidator : NSObject

// 实际验证策略的存根方法
- (BOOL) validateInput:(UITextField *)input error:( NSError **) error;


@end
