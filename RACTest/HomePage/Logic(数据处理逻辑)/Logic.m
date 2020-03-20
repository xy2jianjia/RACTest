//
//  Logic.m
//  RACTest
//
//  Created by monan on 2020/3/19.
//  Copyright © 2020 Wick. All rights reserved.
//

#import "Logic.h"


@implementation Logic

- (void) getHome {
    
    _httpCMD = [[RACCommand alloc] initWithSignalBlock:^RACSignal * _Nonnull(id  _Nullable input) {
        RACSignal *signal = [[RACSignal createSignal:^RACDisposable * _Nullable(id<RACSubscriber>  _Nonnull subscriber) {
            // 请求起飞
            [[Http alloc] get:@"https://www.bing.com/HPImageArchive.aspx?format=js&idx=0&n=100&mkt=zh-CN" parameters:@{} completed:^(id  _Nonnull value) {
                [subscriber sendNext:value];
                [subscriber sendCompleted];
            }];
            return [RACDisposable disposableWithBlock:^{
                
            }];
        }] takeUntil:[self rac_willDeallocSignal]];
        
        return [[signal doNext:^(id  _Nullable x) {
            
        }] materialize] ;
        return signal;
    }];
//    [_httpCMD.executionSignals subscribeNext:^(id  _Nullable x) {
//        NSLog(@"next:%@",x);
//    } ];
//    [_httpCMD execute:nil];
    
}

@end
