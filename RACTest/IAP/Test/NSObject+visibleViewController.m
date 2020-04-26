//
//  NSObject+visibleViewController.m
//  IMCHUMO
//
//  Created by xy2 on 16/9/6.
//  Copyright © 2016年 xy2. All rights reserved.
//

#import "NSObject+visibleViewController.h"

@implementation NSObject (visibleViewController)
//获取当前屏幕显示的viewcontroller
- (UIViewController *)getCurrentVC{
    
    UIViewController *rootViewController =[[[[UIApplication sharedApplication] delegate] window] rootViewController];
    UIViewController *result = [self getVisibleViewControllerFrom:rootViewController];
    return result;
}
- (UIViewController *) getVisibleViewControllerFrom:(UIViewController *) vc {
    if ([vc isKindOfClass:[UINavigationController class]]) {
        return [self getVisibleViewControllerFrom:[((UINavigationController *) vc) visibleViewController]];
    } else if ([vc isKindOfClass:[UITabBarController class]]) {
        return [self getVisibleViewControllerFrom:[((UITabBarController *) vc) selectedViewController]];
    } else {
        if (vc.presentedViewController) {
            return [self getVisibleViewControllerFrom:vc.presentedViewController];
        } else {
            return vc;
        }
    }
    
}
@end
