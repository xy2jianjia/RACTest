//
//  CTMediator+DetailAction.h
//  RACTest
//
//  Created by monan on 2020/3/20.
//  Copyright © 2020 Wick. All rights reserved.
//



#import <CTMediator/CTMediator.h>

NS_ASSUME_NONNULL_BEGIN

@interface CTMediator (DetailAction)
- (UIViewController *)getDetailActionWithURL:(NSString *)url ;
@end

NS_ASSUME_NONNULL_END
