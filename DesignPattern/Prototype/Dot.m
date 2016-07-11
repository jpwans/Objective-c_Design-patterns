//
//  Dot.m
//  Prototype
//
//  Created by jiangqin on 16/7/4.
//  Copyright © 2016年 mopellet. All rights reserved.
//

#import "Dot.h"
#import <QuartzCore/QuartzCore.h>
@implementation Dot
@synthesize size = size_ ,color = color_;

#pragma mark - 
#pragma mark NSCopying delegate method
-(id)copyWithZone:(NSZone *)zone{
    Dot * dotCopy = [[[self class] allocWithZone:zone] initWithLocation:location_];
    //复制color
    [dotCopy setColor:[UIColor colorWithCGColor:[color_ CGColor]]];
    // 复制 size
    [dotCopy setSize:size_];
    return dotCopy;
}


- (void) drawWithContext:(CGContextRef)context{
    CGFloat x = self.location.x;
    CGFloat Y = self.location.y;
    CGFloat frameSize = self.size;
    CGRect frame = CGRectMake(x, y, frameSize, frameSize);
    
    CGContextSetFillColor(context, [self.color CGColor]);
    CGContextFillEllipseInRect(context, frame);
}

-(void)acceptMarkVisitor:(id<MarkVisitor>)visitor{
    [visitor visitDot:self];
}



- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    if (self) {
        color_ = [coder decodeObjectForKey:@"DotColor"];
        size_ = [coder decodeObjectForKey:@"DotSize"];
    }
    return self;
}

- (void)encodeWithCoder:(NSCoder *)coder
{
    [super encodeWithCoder:coder];
    [coder encodeObject:color_ forKey:@"DotColor"];
    [coder encodeObject:size_ forKey:@"DotSize"];
}
@end
