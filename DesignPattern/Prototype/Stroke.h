//
//  Stroke.h
//  Prototype
//
//  Created by jiangqin on 16/7/4.
//  Copyright © 2016年 mopellet. All rights reserved.
//

#import "Vertex.h"

@interface Stroke : NSObject <Mark ,NSCopying>
{
    @private
    UIColor * color_;
    CGFloat size_;
    NSMutableArray * children_;
}

@property (nonatomic ,strong) UIColor * color;
@property (nonatomic ,assign) CGFloat size;
@property (nonatomic ,assign) CGPoint location;
@property (nonatomic ,readonly) NSUInteger count;
@property (nonatomic ,readonly) id <Mark > lastChild;

- (void)addMark:(id<Mark>)mark;
- (void)removeMark:(id<Mark>)mark;
- (id<Mark>)childMarkAtIndex:(NSUInteger)index;
- (id)copyWithZone:(NSZone *)zone;

-(void)acceptMarkVisitor:(id<MarkVisitor>)visitor;
@end
