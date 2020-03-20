//
//  Target_DetailAction.m
//  RACTest
//
//  Created by monan on 2020/3/20.
//  Copyright © 2020 Wick. All rights reserved.
//

#import "Target_DetailAction.h"
#import "DetailViewController.h"

@implementation Target_DetailAction

- (UIViewController *)Action_DetailViewController:(NSDictionary *)params{
    DetailViewController *goodsDetailVC = [[DetailViewController alloc] init];
    goodsDetailVC.url = params[@"url"];
    return goodsDetailVC;
}

@end
