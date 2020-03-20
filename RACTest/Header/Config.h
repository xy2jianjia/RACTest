//
//  Config.h
//  IMCHUMO
//
//  Created by xy2 on 16/9/1.
//  Copyright © 2016年 xy2. All rights reserved.
//

#ifndef Config_h
#define Config_h


#endif /* Config_h */

/*-----framework------*/

#ifdef __OBJC__

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>
#import <UserNotifications/UserNotifications.h>
#import <AVFoundation/AVFoundation.h>
#import <AudioToolbox/AudioToolbox.h>
#import <MediaPlayer/MediaPlayer.h>
#import <sys/utsname.h>
#import <MessageUI/MessageUI.h>
#import <Photos/Photos.h>
#import <AddressBook/AddressBook.h>
#import <Contacts/Contacts.h>
#import <WebKit/WebKit.h>
#import <JavaScriptCore/JavaScriptCore.h>
#import <MapKit/MapKit.h>
#import <UserNotifications/UserNotifications.h>
#import <AssetsLibrary/AssetsLibrary.h>
#import <Photos/Photos.h>
#import <StoreKit/StoreKit.h>
/*-----framework------*/


/*-----support------*/





#import <AFNetworking/AFNetworking.h>
#import <AFNetworking/AFHTTPSessionManager.h>

#import <SDWebImage/UIImageView+WebCache.h>
#import <SDWebImage/SDImageCache.h>
#import <SDWebImage/UIButton+WebCache.h>

#import <ReactiveObjC/ReactiveObjC.h>
#import "NSObject+RACDescription.h"
#import "RACSignal+Operations.h"

#import <Aspects/Aspects.h>

#import "JSONKit.h"






// 抽屉

/*-----support------*/
#import "CTMediator.h"

/*------Action-----*/
#import "CTMediator+DetailAction.h"

/*-----Class------*/
#import "Http.h"
#import "QLAspect.h"

// models


// cache

// classes


/*-----Class------*/

#define SCREEN_SIZE [UIScreen mainScreen].bounds.size
#define SCREEN_WIDTH  SCREEN_SIZE.width
#define SCREEN_HEIGHT  SCREEN_SIZE.height

#define kUIColorFromRGB(rgbValue) [UIColor \
colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 \
green:((float)((rgbValue & 0xFF00) >> 8))/255.0 \
blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]

#define kUIColorFromRGB_Alpha(rgbValue,a) [UIColor \
colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 \
green:((float)((rgbValue & 0xFF00) >> 8))/255.0 \
blue:((float)(rgbValue & 0xFF))/255.0 alpha:(float)a]

#define iPhone4 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(640, 960), [[UIScreen mainScreen] currentMode].size) : NO)

#define iPhone5 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(640, 1136), [[UIScreen mainScreen] currentMode].size) : NO)
#define iPhone6 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(750,1334), [[UIScreen mainScreen] currentMode].size) : NO)

#define iPhonePlus ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1242,2208), [[UIScreen mainScreen] currentMode].size) : NO)

//iphone6P 放大模式
#define iPhonePlusAM ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1125, 2001), [[UIScreen mainScreen] currentMode].size) : NO)

//iphone6 放大模式
#define iPhone6AM ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(640, 1136), [[UIScreen mainScreen] currentMode].size) : NO)
//iphone x
#define iPhoneX ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1125, 2436), [[UIScreen mainScreen] currentMode].size) : NO)

//判断iPHoneXr
#define iPhoneXR ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(828, 1792), [[UIScreen mainScreen] currentMode].size) &&  NO)

//判断iPHoneX、iPHoneXs

#define iPhoneXS ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1125, 2436), [[UIScreen mainScreen] currentMode].size) && NO)

//判断iPhoneXs Max
#define iPhoneXMAX ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1242, 2688), [[UIScreen mainScreen] currentMode].size) &&  NO)
// iPhone X系列
#define iPhoneX_All (((int)((SCREEN_HEIGHT/SCREEN_WIDTH)*100)) == 216)?YES:NO
//#define iPhoneX_All ([UIScreen mainScreen].bounds.size.height == 812 || [UIScreen mainScreen].bounds.size.height == 896)

#define iPad [[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPad

#define isForbiddenAll(target) [target getforbidAll]

#define ios12 [[[UIDevice currentDevice] systemVersion] floatValue] >= 12.0
#define ios11 [[[UIDevice currentDevice] systemVersion] floatValue] >= 11.0
#define ios10 [[[UIDevice currentDevice] systemVersion] floatValue] >= 10.0
#define ios9  [[[UIDevice currentDevice] systemVersion] floatValue] >= 9.0


#define k_scale_w  (SCREEN_WIDTH / 375.0 > 1 ? 1 : SCREEN_WIDTH / 375.0)
#define k_scale_h  (SCREEN_HEIGHT / 667.0 > 1 ? 1 : SCREEN_HEIGHT / 667.0)

#define k_width(x)  ceilf((x) * k_scale_w)
#define k_height(x) ceilf((x) * k_scale_h)
#define k_font(R)     [UIFont systemFontOfSize:k_width(R)]
#define k_bold_font(R)     [UIFont boldSystemFontOfSize:k_width(R)]

static NSString * const BUNDLEID_FOR_KEY = @"com.test.youshon";
static NSString * const BUNDLEID_FOR_TOKEN = @"com.test.youshon_token";
static NSString * const ORDER_NUMBER = @"com.test.youshon_order_number";
// 开发环境
//static NSInteger const kDOMainType = 1000;
// 生产环境
static NSInteger const kDOMainType = 2000;

//typedef NS_ENUM(NSInteger, EXCHANGE_ID) {
//    EXCHANGE_ID_Huobi_Global = 1000,
//    EXCHANGE_ID_Binance,
//    EXCHANGE_ID_Kraken,
//    EXCHANGE_ID_Bitfinex,
//    EXCHANGE_ID_Coinbase,
//    EXCHANGE_ID_OKEx,
//    EXCHANGE_ID_Coinbene,
//};


#ifdef DEBUG
#define NSLog(...) NSLog(@"%s 第%d行 \n %@\n\n",__func__,__LINE__,[NSString stringWithFormat:__VA_ARGS__])
#else
#define NSLog(...)
#endif

#define K_WeakSelf __weak __typeof(self) weakSelf = self





#define k_KeyWindow [[UIApplication sharedApplication] keyWindow]

#define MyJudgeNull(parameter) (nil==parameter|| NULL==parameter || [parameter isKindOfClass:[NSNull class]] ||[[[parameter stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]]stringByReplacingOccurrencesOfString:@"\n" withString:@""] length]==0)
#define MyJudgeModelNotNull(parameter) (!MyJudgeNull(parameter) &&![[NSString stringWithFormat:@"%@",parameter] isEqualToString:@"(null)"] && ![[NSString stringWithFormat:@"%@",parameter] isEqualToString:@"(NULL)"] && ![[NSString stringWithFormat:@"%@",parameter] isEqualToString:@""""] &&![[NSString stringWithFormat:@"%@",parameter] isEqualToString:@"<null>"])

// ----NOTIFICATION_NAME---- //
// 切换主题
static NSString * const CHANGE_THEME_NOTIFICATION = @"CHANGE_THEME_NOTIFICATION";
// 切换语言
static NSString * const CHANGE_LANGUAGE_NOTIFICATION = @"CHANGE_LANGUAGE_NOTIFICATION";
// 切换货币
static NSString * const CHANGE_CURRENCY_NOTIFICATION = @"CHANGE_CURRENCY_NOTIFICATION";
// 自选列表更新数据通知
static NSString * const WATCHLIST_RELOAD_DATA_NOTIFICATION = @"WATCHLIST_RELOAD_DATA_NOTIFICATION";
// 需要重连更新token通知
static NSString * const RECONNECTED_TOKKEN_NOTIFICATION = @"RECONNECTED_TOKKEN_NOTIFICATION";
// 首页切换货币
static NSString * const CHANGE_MARKET_CURRENCY_NOTIFICATION = @"CHANGE_MARKET_CURRENCY_NOTIFICATION";
#endif



