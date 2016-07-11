//
//  Dot.h
//  Prototype
//
//  Created by jiangqin on 16/7/4.
//  Copyright © 2016年 mopellet. All rights reserved.
//

#import "Vertex.h"

@interface Dot : Vertex
{
    @private
    UIColor * color_;
    CGFloat size_;
}

@property (nonatomic ,strong) UIColor * color;
@property (nonatomic ,assign) CGFloat size;
-(id)copyWithZone:(NSZone *)zone;

-(void)acceptMarkVisitor:(id<MarkVisitor>)visitor;

@end
