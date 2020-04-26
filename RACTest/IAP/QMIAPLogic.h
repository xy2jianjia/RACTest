//
//  QMIAPLogic.h
//  MarryPro
//
//  Created by monan on 2020/3/3.
//  Copyright © 2020 QM. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface QMIAPLogic : NSObject
+ (void) goPay:(CommodityModel *)commodityModel completed:(void(^)(NSDictionary *body))completed;
@end

NS_ASSUME_NONNULL_END
