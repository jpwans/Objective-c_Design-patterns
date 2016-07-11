//
//  CustomTextField.h
//  DesignPattern
//
//  Created by jiangqin on 16/7/8.
//  Copyright © 2016年 mopellet. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "InputValidator.h"
@interface CustomTextField : UITextField

@property (strong ,nonatomic) InputValidator * inputValidator;

- ( BOOL) validate;
@end
