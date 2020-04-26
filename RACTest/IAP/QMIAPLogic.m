//
//  QMIAPLogic.m
//  MarryPro
//
//  Created by monan on 2020/3/3.
//  Copyright © 2020 QM. All rights reserved.
//

#import "QMIAPLogic.h"
#import <XYIAPKit/XYIAPKit.h>
#import <XYIAPKit/XYInAppReceipt.h>
#import <XYIAPKit/XYStoreUserDefaultsPersistence.h>
#import <XYIAPKit/XYStoreKeychainPersistence.h>
#import <XYIAPKit/XYStoreiTunesReceiptVerifier.h>

@implementation QMIAPLogic


/// 1、入口
/// @param productId productId description
/// @param completed completed description
+ (void) goPay:(NSString *)productId  completed:(void(^)(BOOL flag ,NSString *msg ,NSDictionary *body))completed{
    
    if ([XYStore canMakePayments]) {
        if ([productId length] <= 0) {
            completed(NO,@"抱歉，无对应产品信息！",nil);
        }
        XYStore *store = [XYStore defaultStore];
        NSSet *set = [NSSet setWithArray:@[productId]];
        K_WeakSelf;
        [store requestProducts:set success:^(NSArray *products, NSArray *invalidProductIdentifiers) {
            if (products.count > 0) {
                SKProduct *product = [products firstObject];
//                [XYStoreiTunesReceiptVerifier shareInstance].sharedSecretKey = IAPSharedKey;
                [weakSelf addPayment:product completed:completed];
            }else{
                completed(NO,@"抱歉，无对应产品信息！",nil);
            }
        } failure:^(NSError *error) {
            completed(NO,@"抱歉，无对应产品信息！",nil);
        }];
    }else{
        completed(NO,@"出于安全考虑，当前设备不支持购买！",nil);
    }
}

/// 2、加入IAP支付请求流程
/// @param product product description
/// @param completed completed description
+ (void) addPayment :(SKProduct *)product completed:(void(^)(BOOL flag ,NSString *msg ,NSDictionary *body))completed{
    XYStore *store = [XYStore defaultStore];
    NSString *productId = product.productIdentifier;
    K_WeakSelf;
    [store addPayment:productId success:^(SKPaymentTransaction *transaction) {
        [weakSelf verifyTransaction:transaction completed:completed];
    } failure:^(SKPaymentTransaction *transaction, NSError *error) {
        /*
        内购验证凭据返回结果状态码说明
        21000 App Store无法读取你提供的JSON数据
        21002 收据数据不符合格式
        21003 收据无法被验证
        21004 你提供的共享密钥和账户的共享密钥不一致
        21005 收据服务器当前不可用
        21006 收据是有效的，但订阅服务已经过期。当收到这个信息时，解码后的收据信息也包含在返回内容中
        21007 收据信息是测试用（sandbox），但却被发送到产品环境中验证
        21008 收据信息是产品环境中使用，但却被发送到测试环境中验证
        */
        NSString *msg = @"";
        if (transaction.error.code == SKErrorPaymentCancelled) {
            msg = @"已取消操作";
        }else{
            // 可具体分开
            msg = transaction.error.localizedDescription;
        }
        completed(NO,msg,nil);
    }];
}
/// 3、客户端验证支付结果
/// @param transaction transaction description
/// @param completed completed description
+ (void)verifyTransaction:(SKPaymentTransaction *)transaction completed:(void(^)(BOOL flag ,NSString *msg ,NSDictionary *body))completed{
    K_WeakSelf;
    XYStore *store = [XYStore defaultStore];
    [store base64Receipt:^(NSString *base64Data) {
        [store fetchProduct:transaction.payment.productIdentifier success:^(SKProduct *product) {
            [weakSelf verifyTransactionToServer:base64Data completed:completed];
        } failure:^(NSError *error) {
            completed(NO,@"验证结果失败",nil);
        }];
    } failure:^(NSError *error) {
        completed(NO,@"验证结果失败",nil);
    }];
}
/// 4、服务端验证支付结果
/// @param base64Data base64Data description
/// @param completed completed description
+ (void)verifyTransactionToServer:(NSString *)base64Data completed:(void(^)(BOOL flag ,NSString *msg ,NSDictionary *body))completed{
    
    NSString *url = [NSString stringWithFormat:@"%@IAp", @""];
    NSMutableDictionary *para = @{}.mutableCopy;

    [para setObject:base64Data forKey:@"appleReceipt"];

    [Http post:url param:para completed:^(id infoDict) {
        if ([infoDict isKindOfClass:[NSDictionary class]]) {
            completed(YES,@"验证结果失败",infoDict);
        }else{
            completed(NO,@"验证结果失败",nil);
        }
    }];
    
}

@end
