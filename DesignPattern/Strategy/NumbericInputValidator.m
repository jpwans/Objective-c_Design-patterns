//
//  NumbericInputValidator.m
//  DesignPattern
//
//  Created by jiangqin on 16/7/8.
//  Copyright © 2016年 mopellet. All rights reserved.
//

#import "NumbericInputValidator.h"

@implementation NumbericInputValidator

- (BOOL)validateInput:(UITextField *)input error:(NSError *__autoreleasing *)error{
    NSError * regError = nil;
    NSRegularExpression * regex = [NSRegularExpression
                                   regularExpressionWithPattern:@"^[0-9]*$"
                                   options:NSRegularExpressionAnchorsMatchLines error:&regError];
    
    NSUInteger numberOfMatches = [regex
                                  numberOfMatchesInString:[input text]
                                  options:NSMatchingAnchored
                                  range:NSMakeRange(0, input.text.length)];
    
    if (numberOfMatches == 0) {
        if (error != nil) {
            NSString * description = NSLocalizedString(@"Input Validation Failed", @"");
            NSString * reason  = NSLocalizedString(@"The input can contain only numberical values",
                                                   @"");
            NSArray * objArray = @[description,reason];
            NSArray * keyArray = @[NSLocalizedDescriptionKey,NSLocalizedFailureReasonErrorKey];
            
            NSDictionary * userInfo = [NSDictionary dictionaryWithObjects:objArray forKeys:keyArray];
            
            *error = [NSError errorWithDomain:@"" code:1001 userInfo:userInfo];
        }
        return NO;
    }
    return YES;
}
@end
