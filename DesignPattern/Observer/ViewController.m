//
//  ViewController.m
//  Observer
//
//  Created by jiangqin on 16/7/6.
//  Copyright © 2016年 mopellet. All rights reserved.
//

#import "ViewController.h"
#import "SubscriptionServiceCenterProtocol.h"
#import "SubscriptionServiceCenter.h"
@interface ViewController ()<SubscriptionServiceCenterProtocol>

@end
static NSString *SCIENCE = @"SCIENCE";
@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    NSNotification * notification = [NSNotification notificationWithName:@"data chages" object:self];
    NSNotificationCenter * notificationCenter = [NSNotificationCenter defaultCenter];
    [notificationCenter postNotification:notification];
    
    [notificationCenter addObserver:self selector:@selector(update:) name:@"data change" object:nil];
    
    
    //通知 一个中心对象为所有观察者提供变更通知主要从广义上关注程序的事件
    //键值观察 被观察的对象直接向观察者发送通知绑定于特定的对象属性的值
    
    
    
    // 创建订阅号
    [SubscriptionServiceCenter createSubscriptionNumber:SCIENCE];
    
    // 添加订阅的用户到指定的刊物
    [SubscriptionServiceCenter addCustomer:self
                    withSubscriptionNumber:SCIENCE];
    
    // 发行机构发送消息
    [SubscriptionServiceCenter sendMessage:@"V1.0" toSubscriptionNumber:SCIENCE];
    
    
}


- (void)update:(NSNotification *) noti{

}

-(void)subscriptionMessage:(id)message subscriptionNumber:(NSString *)subscriptionNumber{
    NSLog(@"%@",message);
    NSLog(@"%@",subscriptionNumber);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
