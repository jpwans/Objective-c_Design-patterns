
//
//  Mark.h
//  Prototype
//
//  Created by jiangqin on 16/7/4.
//  Copyright © 2016年 mopellet. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>


@protocol MarkVisitor;

@protocol Mark <NSObject, NSCopying, NSCoding>
@property (nonatomic ,strong) UIColor * color;
@property (nonatomic ,assign) CGFloat size;
@property (nonatomic ,assign) CGPoint location;
@property (nonatomic ,readonly) NSUInteger count;
@property (nonatomic ,readonly) id <Mark> lastChild;

typedef void (^MarkEnumerationBlock)(id <Mark> item, BOOL * stop);

- (id)copy;
- (void) addMark:(id <Mark>) mark;
- (void) removeMark:(id <Mark>) mark;
- (id <Mark>) childMarkAtIndex:(NSUInteger) index;
- (void) drawWithContext:(CGContextRef)context;

- (NSEnumerator *) enumerator;
- (void) enumerateMarksUsingBlock:(MarkEnumerationBlock)block;


- (void) acceptMarkVisitor:(id <MarkVisitor>)visitor;

@end
