//
//  CommodityModel.m
//  MarryPro
//
//  Created by monan on 2019/1/4.
//  Copyright © 2019 QM. All rights reserved.
//

#import "CommodityModel.h"

@implementation CommodityModel


+ (void) getCommodityList:(void(^)(NSArray *commodityList)) completed{
//    NSString *url = @"http://test.imqumei.com/PayList/api/Plist";
    NSString *url = [NSString stringWithFormat:@"%@Plist",[DOMainConfig API_MARRY]];
    NSMutableDictionary *para = @{@"paymode":@"3"}.mutableCopy;
    NSString *userId = [self currentUserId];
    if (userId) {
        [para setObject:userId forKey:@"userid"];
    }
    NSString *token = [QMToken getLocalToken];
    if (token) {
        [para setObject:token forKey:@"token"];
    }
    [HttpOperation get:url param:para completed:^(id infoDict) {
        
        NSArray *plArr = [infoDict objectForKey:@"body"];
//        NSArray *plArr = [body objectForKey:@"pl"];
        NSMutableArray *arr = [NSMutableArray array];
        for (NSDictionary *temp in plArr) {
            CommodityModel *item = [[CommodityModel alloc]init];
            [item setValuesForKeysWithDictionary:temp];
#warning iapId 要设置 2020年04月23日09:05:53
            item.iapId = @"com.xiangqin.marry.qm.001";
            [arr addObject:item];
        }
        
//        [QMConfigCache getConfigArrayWithParentKey:<#(nonnull NSString *)#>];
        
        completed(arr);
    }];
    
}
+ (void) getAuthCommodityList:(void(^)(NSArray *commodityList)) completed{
    NSString *url = [NSString stringWithFormat:@"%@AttPay",[DOMainConfig API_MARRY]];
    NSMutableDictionary *para = @{@"paymode":@"3"}.mutableCopy;
    NSString *userId = [self currentUserId];
    if (userId) {
        [para setObject:userId forKey:@"userid"];
    }
    NSString *token = [QMToken getLocalToken];
    if (token) {
        [para setObject:token forKey:@"token"];
    }
    [HttpOperation get:url param:para completed:^(id infoDict) {
        
        NSDictionary *body = [infoDict objectForKey:@"body"];
        NSMutableArray *arr = [NSMutableArray array];
        CommodityModel *item = [[CommodityModel alloc]init];
        [item setValuesForKeysWithDictionary:body];
#warning iapId 要设置 2020年04月23日09:05:53
        item.iapId = @"com.xiangqin.marry.qm.001";
        [arr addObject:item];
        
        completed(arr);
    }];
    
}

@end
