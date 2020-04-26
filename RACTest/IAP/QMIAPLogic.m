//
//  QMIAPLogic.m
//  MarryPro
//
//  Created by monan on 2020/3/3.
//  Copyright © 2020 QM. All rights reserved.
//

#import "QMIAPLogic.h"
#import "CommodityModel.h"
#import "NSObject+visibleViewController.h"
#import <XYIAPKit/XYIAPKit.h>
#import <XYIAPKit/XYInAppReceipt.h>
#import <XYIAPKit/XYStoreUserDefaultsPersistence.h>
#import <XYIAPKit/XYStoreKeychainPersistence.h>
#import <XYIAPKit/XYStoreiTunesReceiptVerifier.h>

@implementation QMIAPLogic


+ (void) goPay:(CommodityModel *)commodityModel  completed:(void(^)(NSDictionary *body))completed{

    if ([XYStore canMakePayments]) {
        XYStore *store = [XYStore defaultStore];
        NSSet *set = [NSSet setWithArray:@[commodityModel.iapId]];
        K_WeakSelf;
        [store requestProducts:set success:^(NSArray *products, NSArray *invalidProductIdentifiers) {
            if (products.count > 0) {
                SKProduct *product = [products firstObject];
//                [XYStoreiTunesReceiptVerifier shareInstance].sharedSecretKey = IAPSharedKey;
                [weakSelf addPayment:product commodityModel:commodityModel  completed:completed];
            }else{
                [self showAlert:@"抱歉，无对应产品信息！"];
                completed(nil);
            }
        } failure:^(NSError *error) {
            completed(nil);
        }];
    }else{
        [self showAlert:@"出于安全考虑，当前设备不支持购买！"];
        completed(nil);
    }
}

+ (void) addPayment :(SKProduct *)product commodityModel:(CommodityModel *)commodityModel  completed:(void(^)(NSDictionary *body))completed{
    XYStore *store = [XYStore defaultStore];
    NSString *productId = product.productIdentifier;
    K_WeakSelf;
    [store addPayment:productId success:^(SKPaymentTransaction *transaction) {
        [weakSelf verifyTransaction:transaction commodityModel:commodityModel completed:completed];
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
        if (transaction.error.code == SKErrorPaymentCancelled) {
            [weakSelf showAlert:@"已取消操作"];
        }else{
            [weakSelf showAlert:transaction.error.localizedDescription];
            
        }
        completed(nil);
    }];
}
+ (void)verifyTransaction:(SKPaymentTransaction *)transaction commodityModel:(CommodityModel *)commodityModel  completed:(void(^)(NSDictionary *body))completed{
    K_WeakSelf;
    XYStore *store = [XYStore defaultStore];
    [store base64Receipt:^(NSString *base64Data) {
        [store fetchProduct:transaction.payment.productIdentifier success:^(SKProduct *product) {
            [weakSelf verifyTransactionToServer:base64Data commodityModel:commodityModel completed:completed];
        } failure:^(NSError *error) {
            completed(nil);
        }];
    } failure:^(NSError *error) {
        completed(nil);
    }];
}
+ (void) showAlert :(NSString *)errorMsg{
    
    NSString *msg = errorMsg;
    NSString *title = @"提示";
    UIAlertController *vc = [UIAlertController alertControllerWithTitle:title message:msg preferredStyle:(UIAlertControllerStyleAlert)];
    UIAlertAction *action3 = [UIAlertAction actionWithTitle:@"知道了" style:(UIAlertActionStyleCancel) handler:^(UIAlertAction * _Nonnull action) {
        
    }];
    [vc addAction:action3];
    UIViewController *alertVc = [self getCurrentVC];
    [alertVc presentViewController:vc animated:YES completion:nil];
}
+ (void)verifyTransactionToServer:(NSString *)base64Data commodityModel:(CommodityModel *)commodityModel  completed:(void(^)(NSDictionary *body))completed{
    
//    NSString *url = [NSString stringWithFormat:@"%@IAp", [DOMainConfig API_PAY]];
//    NSMutableDictionary *para = @{}.mutableCopy;
//    NSString *itemId = [self itemId];
//    [para setObject:itemId forKey:@"itemid"];
//    NSString *appId = [self ysAppId];
//    [para setObject:appId forKey:@"appid"];
//    NSString *version = [[self appVersion] stringByReplacingOccurrencesOfString:@"." withString:@""];
//    [para setObject:version forKey:@"version"];
//    NSString *channel = [self ysAppChannel];
//    [para setObject:channel forKey:@"channel"];
//    [para setObject:@(commodityModel.total_fee) forKey:@"total_fee"];
//
//    [para setObject:@(commodityModel.ListId) forKey:@"listid"];
//    NSString *subject = @"product";
//
//    [para setObject:subject forKey:@"subject"];
//    NSString *describe = @"describedescribedescribe";
//    [para setObject:describe forKey:@"describe"];
//    [para setObject:@"" forKey:@"shareid"];
//    [para setObject:@(PAY_TYPE_IAP) forKey:@"paytype"];
//
//    [para setObject:base64Data forKey:@"appleReceipt"];
//
//    NSString *userId = [self currentUserId];
//    if ([userId length] <= 0) {
//        completed(nil);
//        return;
//    }
//    [para setObject:userId forKey:@"userid"];
//    NSString *token = [QMToken getLocalToken];
//    if ([token length] <= 0) {
//        completed(nil);
//        return;
//    }
//
//    [HttpOperation post:url param:para completed:^(id infoDict) {
//        if ([infoDict isKindOfClass:[NSDictionary class]]) {
//            completed(infoDict);
//        }else{
//            completed(nil);
//        }
//    }];
    
}
@end
