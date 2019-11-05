//
//  HDSingleMethodTool.h
//  HDOnlineClassroom
//
//  Created by 王景伟 on 2019/8/30.
//  Copyright © 2019 王景伟. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "HDUserModel.h"

typedef enum : NSUInteger {
    HDProductNetworkTypeDebug = 0,
    HDProductNetworkTypeRelease,
    HDProductNetworkTypePre,
    HDProductNetworkTypeDisaster
} HDProductNetworkType;

NS_ASSUME_NONNULL_BEGIN

#define HDSingleMethodToolDefault [HDSingleMethodTool defaultSingleMethodTool]

@interface HDSingleMethodTool : NSObject

+ (instancetype)defaultSingleMethodTool;

/** 是否是生产网络环境 */
@property (nonatomic, assign, readonly) HDProductNetworkType productNetworkType;

/** 0.正常状态 1.审核 2.半审核状态：半审核状态下，仅让支付是审核下 */
@property (assign, nonatomic) int16_t isVerify;

///< 公共参数
+ (NSDictionary *)commonParams;
///< 获取版本号
+ (NSString *)appVersion;
///< 消息的公共参数
+ (NSDictionary *)messageCommonParams;

/**
 在保存个人信息的时候保存登录appRole的值
 
 @param userModel 用户信息
 */
+ (void)saveAppRoleOnLoginWithUserModel:(HDUserModel *)userModel;

/**
 清空用户信息
 包含登录和用户信息,同时包含分社信息
 */
+ (void)clearnUserInfo;

/**
 给网页接口拼接公共参数.
 
 @param webStr 网页地址
 @param paras 参数
 @return 返回地址
 */
+ (NSString *)combineCommonParasWithUrlString:(NSString *)webStr paras:(NSDictionary *)paras;

/**
 加载DNS的url地址
 
 @param urlStr 原始地址
 @param success 如果成功，返回处理后的dns地址
 @param fail 失败
 */
+ (void)loadHTTPDNSWithUrlStr:(NSString *)urlStr andSuccess:(void(^)(NSString *ipUrl))success Fail:(void(^)())fail;

/**
 加载直播DNS的url地址
 
 @param urlStr 原始地址
 @param success 如果成功，返回处理后的dns地址
 @param fail 失败
 */
+ (void)loadLiveHTTPDNSWithUrlStr:(NSString *)urlStr andSuccess:(void(^)(NSString *ipUrl))success Fail:(void(^)())fail;

/**
 返回header的参数,其中必须为字符串,所以将内部integer参数转成string
 
 @return 参数
 */
+ (NSDictionary *)headerValueDictionary;
@end

NS_ASSUME_NONNULL_END
