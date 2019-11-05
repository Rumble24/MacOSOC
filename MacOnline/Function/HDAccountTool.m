//
//  HDAccountTool.m
//  yanxishe
//
//  Created by Fly on 16/4/18.
//  Copyright © 2016年 hundun. All rights reserved.
//
#import <AdSupport/AdSupport.h>
#import "HDAccountTool.h"
#import "NSString+YYAdd.h"

@interface HDAccountTool ()

@property (nonatomic, strong) HDUserModel *accountModel;
@end


@implementation HDAccountTool

+ (instancetype)shareNetworkTools {
    static HDAccountTool *tools = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        tools = [[HDAccountTool alloc] init];
    });
    return tools;
}


+ (int16_t)isVerify {
    return HDSingleMethodToolDefault.isVerify;
}

+ (void)saveAccount:(HDUserModel *)account {
    [HDAccountTool shareNetworkTools].accountModel = account;
//    [SQDBTools saveAccountInfo:account];
}

+ (void)deleteAccount {
    HDUserModel *obj = [self blankAccount];
    [HDAccountTool shareNetworkTools].accountModel = obj;
//    [SQDBTools saveAccountInfo:obj];
}

+ (HDUserModel *)account {
    HDUserModel *account = [HDAccountTool shareNetworkTools].accountModel;
//    if (!account) {
//        account = [SQDBTools getAccountInfo];
//        
//        if (!account.uid.length) {
//            account = [SQDBTools getLoginInfo];
//        }
//        [HDAccountTool shareNetworkTools].accountModel = account;
//    }
    return account;
}

+ (HDUserModel *)blankAccount {
    HDUserModel *account = [[HDUserModel alloc] init];
    account.uid = @"";
    account.headImg = @"";
    account.name = @"";
    account.studentNo = @"";
    account.applyScene = -1;
    account.industry = @"";
    account.position = @"";
    account.company = @"";
    account.province = @"";
    account.city = @"";
    account.nickname = @"";
    account.weixin = @"";
    account.expireTimeDisplay = @"";
    account.phone = @"";
    account.openId = @"";
    account.tpType = @"";
    account.studyValue = @"";
    account.is7daysUser = 0;
    account.in7daysPeriod = 0;
    return account;
}



/**
 *  存储授权信息
 */
+ (void)saveLoginInfo:(HDUserModel *)loginInfo {
    [HDAccountTool shareNetworkTools].accountModel = loginInfo;
    [[NSUserDefaults standardUserDefaults] setObject:loginInfo.phone?:@"" forKey:@"HDLastLoginPhone"];
}

/**
 *  清楚授权信息
 */
+ (void)deleteLoginInfo {
    HDUserModel *obj = [self blankAccount];
//    [SQDBTools saveLoginInfo:obj];
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        
        //清除信息的同时，退出环信
//        [[HDClient sharedClient] logout:YES];
    });
    //通过清除红点，来清除环信代理
    [[NSNotificationCenter defaultCenter] postNotificationName:@"appReddotMeNoti" object:nil];
    
    [self clearPushAlias];
//    [Bugly setUserIdentifier:@""];
//    [[BLPaymentManager sharedManager] logoutPaymentManager];
}

/**
 *  读取授权信息
 */
+ (HDUserModel *)loginInfo {
//    HDUserModel *account = [SQDBTools getLoginInfo];
    return HDUserModel.new;
}

/**
 *  带有空字符串的用户信息，防止请求报错
 */
+ (HDUserModel *)blankLoginInfo {
    HDUserModel *account = [[HDUserModel alloc] init];
    account.uid = @"";
    account.headImg = @"";
    account.name = @"";
    account.studentNo = @"";
    account.applyScene = -1;
    account.industry = @"";
    account.position = @"";
    account.company = @"";
    account.province = @"";
    account.city = @"";
    account.nickname = @"";
    account.weixin = @"";
    account.expireTimeDisplay = @"";
    account.phone = @"";
    account.openId = @"";
    account.tpType = @"";
    account.studyValue = @"";
    account.is7daysUser = 0;
    account.in7daysPeriod = 0;
    account.unionId = @"";
    return account;
}

+ (NSTimeInterval)timeStamp {
    
    return [[NSDate date] timeIntervalSince1970];
}

+ (NSString *)authCode:(int64_t)timeStamp {
    
    NSString *src = [NSString stringWithFormat:@"app_key=%@&timestamp=%lld",@"358e36bea512d841bed9212952362ac4", timeStamp];
    return src.md5String;
}


+ (NSString *)appVersion {
    
    return [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"];
}


@end
