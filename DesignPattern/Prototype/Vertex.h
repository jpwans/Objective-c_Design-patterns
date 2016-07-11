//
//  Vertex.h
//  Prototype
//
//  Created by jiangqin on 16/7/4.
//  Copyright © 2016年 mopellet. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Mark.h"
@interface Vertex : NSObject <Mark ,NSCopying>
{
    @protected
    CGPoint location_;
}
@property (nonatomic ,strong) UIColor * color;
@property (nonatomic ,assign) CGFloat size;
@property (nonatomic ,assign) CGPoint location;
@property (nonatomic ,readonly) NSUInteger count;
@property (nonatomic ,readonly) id <Mark> lastChild;

- (id) initWithLocation:(CGPoint) location;
- (void) addMark:(id <Mark>) mark;
- (void) removeMark:(id <Mark>) mark;
- (id <Mark>) childMarkAtIndex:(NSUInteger) index;

- (id) copyWithZone:(NSZone *)zone;

- (void)acceptMarkVisitor:(id<MarkVisitor>)visitor;
@end
