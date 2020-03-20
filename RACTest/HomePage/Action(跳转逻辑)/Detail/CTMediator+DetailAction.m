//
//  CTMediator+DetailAction.m
//  RACTest
//
//  Created by monan on 2020/3/20.
//  Copyright © 2020 Wick. All rights reserved.
//

#import "CTMediator+DetailAction.h"

// 一般一个category 只要一个ActionName
static NSString *ActionName = @"DetailAction";

// 对应多个方法ActionName这个类内的方法
static NSString *ActionMethod = @"DetailViewController";

@implementation CTMediator (DetailAction)


// 组件跳转 第一步：创建category

- (UIViewController *)getDetailActionWithURL:(NSString *)url {
    NSMutableDictionary *params = [[NSMutableDictionary alloc] init];
    params[@"url"] = url;
    return [self performTarget:ActionName action:ActionMethod params:params shouldCacheTarget:NO];
}


@end
