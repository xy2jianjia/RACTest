//
//  Target_DetailAction.m
//  RACTest
//
//  Created by monan on 2020/3/20.
//  Copyright © 2020 Wick. All rights reserved.
//

#import "Target_DetailAction.h"
#import "DetailViewController.h"

/// 在此创建真正的controller
/// 类名对应category那边设置的ActionName

@implementation Target_DetailAction

// 组件跳转 第 2 步：创建category那边的类名 ActionName 对应的类  和 方法名 ActionMethod对应的方法

- (UIViewController *)Action_DetailViewController:(NSDictionary *)params{
    DetailViewController *goodsDetailVC = [[DetailViewController alloc] init];
    goodsDetailVC.url = params[@"url"];
    return goodsDetailVC;
}

@end
