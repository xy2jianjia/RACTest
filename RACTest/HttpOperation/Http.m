//
//  Http.m
//  RACTest
//
//  Created by monan on 2020/3/19.
//  Copyright © 2020 Wick. All rights reserved.
//

#import "Http.h"


@implementation Http

- (void) get:(NSString *)url parameters:(NSDictionary *)para completed:(void(^)(id value))completed{
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.requestSerializer = [AFHTTPRequestSerializer serializer];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    [manager GET:url parameters:para progress:^(NSProgress * _Nonnull downloadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        completed(responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        completed(nil);
    }];
}


@end
