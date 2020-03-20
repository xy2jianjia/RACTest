//
//  Logic.h
//  RACTest
//
//  Created by monan on 2020/3/19.
//  Copyright © 2020 Wick. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Logic : NSObject

@property (nonatomic,strong) RACCommand *httpCMD;
- (void) getHome;

@end

NS_ASSUME_NONNULL_END
