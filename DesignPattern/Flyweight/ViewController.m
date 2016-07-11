//
//  ViewController.m
//  Flyweight
//
//  Created by jiangqin on 16/7/11.
//  Copyright © 2016年 mopellet. All rights reserved.
//

#import "ViewController.h"
#import "FlowerView.h"
#import "FlowerFactory.h"
#import "FlyweightView.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)loadView {
    FlyweightView * flyweightView = [[FlyweightView alloc] initWithFrame:self.view.bounds];
    
    self.view = flyweightView;

}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    // 享元模式 一个类的一百万个对象 根据父类型返回各种类型的具体享元对象  节省内存
    
    FlowerFactory * factory = [[FlowerFactory alloc] init];
    NSMutableArray * flowerList = [[NSMutableArray alloc] initWithCapacity:500];
    
    for (int i = 0; i < 500; i++) {
        // 使用随机花朵类型
        // 从花朵工厂取得一个共享的花朵享元对象实例
        FlowerType flowerType = arc4random() % kTotalNumberOfFlowerTypes;
        UIView * flowerView = [factory flowerViewWithType:flowerType];
        
        //设置花朵的显示位置和区域
        CGRect screenBounds = [[UIScreen mainScreen] bounds];
        CGFloat x = (arc4random() % (NSInteger)screenBounds.size.width);
        CGFloat y = (arc4random() % (NSInteger)screenBounds.size.height);
        NSInteger minSize = 10;
        NSInteger maxSize = 50;
        CGFloat size = (arc4random() % (maxSize - minSize + 1)) + minSize;
        
        //把花朵的属性赋给一个外在状态对象
        ExtrinsicFlowerState extrinsicState;
        extrinsicState.flowerView = flowerView;
        extrinsicState.area = CGRectMake(x, y, size, size);
        
        //把外在的花朵状态添加到花朵列表
        [flowerList addObject:
         [NSValue value:&extrinsicState withObjCType:@encode(ExtrinsicFlowerState)]];
        
        [(FlyweightView *)self.view setFlowerList:flowerList];
    }
    
    // 把花朵列表添加到这个FlyweightView实例
    
}

@end
