//
//  CTMediator+DetailAction.m
//  RACTest
//
//  Created by monan on 2020/3/20.
//  Copyright © 2020 Wick. All rights reserved.
//

#import "CTMediator+DetailAction.h"




@implementation CTMediator (DetailAction)

- (UIViewController *)getDetailActionWithURL:(NSString *)url {
    NSMutableDictionary *params = [[NSMutableDictionary alloc] init];
    params[@"url"] = url;
    return [self performTarget:@"DetailAction" action:@"DetailViewController" params:params shouldCacheTarget:NO];
}


@end
