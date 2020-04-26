//
//  Http.h
//  RACTest
//
//  Created by monan on 2020/3/19.
//  Copyright © 2020 Wick. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Http : NSObject


- (void) get:(NSString *)url parameters:(NSDictionary *)para completed:(void(^)(id value))completed;

+ (void) post:(NSString *)url param:(NSDictionary *)para completed:(void(^)(id infoDict))completed ;
@end

NS_ASSUME_NONNULL_END
