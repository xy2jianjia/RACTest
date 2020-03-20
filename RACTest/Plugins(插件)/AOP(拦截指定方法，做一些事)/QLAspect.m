//
//  QLAspect.m
//  RACTest
//
//  Created by monan on 2020/3/20.
//  Copyright © 2020 Wick. All rights reserved.
//

#import "QLAspect.h"

typedef void(^HookViewDidLoadBlock)(id<AspectInfo> aspectInfo, BOOL animated);

@interface QLAspect ()

@property (nonatomic,copy) HookViewDidLoadBlock hookViewDidLoadBlock;

@end

@implementation QLAspect

+ (instancetype) shareInstance {
    static QLAspect *aspect = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        aspect = [[QLAspect alloc] init];
    });
    return aspect;
}
+ (void) configAspect {
    [[QLAspect shareInstance] configAspect];
}
- (void) configAspect {
    _hookViewDidLoadBlock = ^(id<AspectInfo> aspectInfo, BOOL animated){
        NSLog(@"控制器 %@ 将要显示: %tu", aspectInfo.instance, animated);
    };
    
    NSError *error = nil;
    [UIViewController aspect_hookSelector:@selector(viewDidAppear:) withOptions:(AspectPositionAfter) usingBlock:_hookViewDidLoadBlock  error:&error];
//
//    [UIViewController aspect_hookSelector:@selector(viewDidAppear:) withOptions:(AspectPositionAfter) usingBlock:^(id<AspectInfo> aspectInfo, BOOL animated) {
//
//        UIViewController* viewController = aspectInfo.instance;
//        if (viewController.title) {
////            [MobClick beginLogPageView:viewController.title];
//        }
//    } error:&error];
    
    
}
+ (void) configAspect_class {
    NSError *error = nil;
    [UIViewController aspect_hookSelector:@selector(viewDidLoad) withOptions:(AspectPositionAfter) usingBlock:^() {
//        NSLog(@"控制器 %@ 将要显示: %tu", aspectInfo.instance, animated);
        
    }  error:&error];
}

@end
