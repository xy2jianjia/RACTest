//
//  CommodityModel.h
//  MarryPro
//
//  Created by monan on 2019/1/4.
//  Copyright © 2019 QM. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface CommodityModel : NSObject

@property (nonatomic,assign) NSInteger itemid;
@property (nonatomic,assign) NSInteger paymode;
@property (nonatomic,assign) NSInteger ListId;
@property (nonatomic,copy) NSString *title;
@property (nonatomic,assign) NSInteger buyitem;
@property (nonatomic,assign) float Original_price;
@property (nonatomic,assign) float total_fee;
@property (nonatomic,assign) NSInteger get_bi;
@property (nonatomic,assign) NSInteger give_bi;
@property (nonatomic,copy) NSString *subtitle;
@property (nonatomic,copy) NSString *iapId;
+ (void) getCommodityList:(void(^)(NSArray *commodityList)) completed;

/**
 认证p费用

 @param completed completed description
 */
+ (void) getAuthCommodityList:(void(^)(NSArray *commodityList)) completed;
@end

NS_ASSUME_NONNULL_END
