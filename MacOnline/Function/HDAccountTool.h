//
//  HDAccountTool.h
//  yanxishe
//
//  Created by Fly on 16/4/18.
//  Copyright © 2016年 hundun. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "HDUserModel.h"

@interface HDAccountTool : NSObject

///< 状态
+ (int16_t)isVerify;

///< 获取版本
+ (NSString *)appVersion;

///< 获取timeStamp
+ (NSTimeInterval)timeStamp;

///< 获取authCode
+ (NSString *)authCode:(int64_t)timeStamp;

///< 存储授权信息
+ (void)saveAccount:(HDUserModel *)account;

///< 清楚授权信息
+ (void)deleteAccount;

///< 读取授权信息
+ (HDUserModel *)account;

///< 带有空字符串的用户信息，防止请求报错
+ (HDUserModel *)blankAccount;

///< 设置推送关联userId
+ (void)setPushAlias;

///< 清除推送关联userId
+ (void)clearPushAlias;

///< 需要用户的信息到内存
+ (void)saveLoginInfo:(HDUserModel *)loginInfo;

///< 删除授权信息
+ (void)deleteLoginInfo;

///< 读取授权信息
+ (HDUserModel *)loginInfo;

@end
