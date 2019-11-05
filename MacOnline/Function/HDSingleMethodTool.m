//
//  HDSingleMethodTool.m
//  HDOnlineClassroom
//
//  Created by 王景伟 on 2019/8/30.
//  Copyright © 2019 王景伟. All rights reserved.
//

#import "HDSingleMethodTool.h"

//控制网络环境默认值 参考枚举HDProductNetworkType-HDProductNetworkTypeDebug、HDProductNetworkTypeRelease、HDProductNetworkTypePre
#define kProductNetworkType HDProductNetworkTypeDebug

@interface HDSingleMethodTool ()
/** 是否是生产网络环境 */
@property (nonatomic, assign, readwrite) HDProductNetworkType productNetworkType;
@end

@implementation HDSingleMethodTool

+ (instancetype)defaultSingleMethodTool {
    static HDSingleMethodTool *tools = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        tools = [[HDSingleMethodTool alloc] init];
    });
    return tools;
}

+ (NSDictionary *)commonParams {
    NSString *ts = [NSString stringWithFormat:@"%.0f" ,[NSDate date].timeIntervalSince1970*1000];
    return @{
             @"versionName": [self appVersion],
             @"isVerify":@([HDAccountTool isVerify]),
             @"user_id" : HDUID,
             @"app_role" : @"yxs",
             @"ts" : ts,
             @"clinet_type":@"ios",
             };
}



+ (NSString *)appVersion {
    return [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"];
}

+ (NSDictionary *)messageCommonParams {
    NSDate *datenow = [NSDate date];
    NSString *timeSp = [NSString stringWithFormat:@"%ld", (long)([datenow timeIntervalSince1970]*1000)];
    return @{
             @"user_id" : HDUID,
             @"user_name" : STRING_NIL([HDAccountTool account].name),
             @"user_avatar" : STRING_NIL([HDAccountTool account].headImg),
             @"time_stamp" : timeSp,
             @"message_version" : @"0",
             };
}

#pragma mark -- 在保存个人信息的时候保存登录appRole的值
+ (void)saveAppRoleOnLoginWithUserModel:(HDUserModel *)userModel {
    //刚进入app的时候记录他的身份类型.
    [HDAccountTool saveAccount:userModel];
}

/**
 设置是否是生产环境的默认值
 @param isProductAnalytics 统计上传是否是生产环境，并且这个决定了在登录注册页面是否有切换上下线开关
 @param productNetworkType 网络是否是生产环境，可以通过取值获得
 */
- (void)setupProduct {
    //如果数据统计是线下，那么网络可以通过改变
    NSNumber *productNetworkType = [[NSUserDefaults standardUserDefaults] objectForKey:@"HDProductNetworkType"];
    //如果有存过数据，按存的来，没有自己修改
    if (productNetworkType) {
        self.productNetworkType = productNetworkType.integerValue;
    } else {
        self.productNetworkType = kProductNetworkType;
    }
}

#pragma mark -- 清空用户信息
+ (void)clearnUserInfo {
    [HDAccountTool deleteLoginInfo];
    [HDAccountTool deleteAccount];
//    HDSingleMethodToolDefault.communityResultModel = nil;
    //退出登录,通知tabBar取消红点
    [[NSNotificationCenter defaultCenter] postNotificationName:@"appReddotMeNoti" object:nil];
    // 清空所有的播放记录和用户信息
//    [SQDBTools db_deleteAllProgressModel];
//    [SQDBTools delete3DTouchRecordModel];
//    [HDSingleMethodTool refresh3DTouchItems];
//    [[HDAudioPlayerService shareInstance] stopCurrentAudio];
//    [[HDDownloaderManager shareInstance] suspendAllItems];
//    [SQDBTools db_deleteLaunchScreenRecord];
//    [SQDBTools db_deleteLaunchScreenAlertRecord];
//    [SQDBTools db_deleteAllComment];
//    [SQDBTools db_deleteTable:@"course_list_table"];
    // 如果正在播放则销毁播放器
    [[NSNotificationCenter defaultCenter] postNotificationName:@"mLinkStopVideo" object:@"1"];
//    [SQDBTools db_deleteAudioViewModel];
    //清空打赏手机号
    [[NSUserDefaults standardUserDefaults] setObject:@"" forKey:@"lastRewardPhone"];
    [[NSUserDefaults standardUserDefaults] synchronize];
    //清空推广大使的默认选项
    [[NSUserDefaults standardUserDefaults] removeObjectForKey:@"recommend_dufalut"];
    [[NSUserDefaults standardUserDefaults] removeObjectForKey:@"recommend_shareType"];
//    [[HDMediaTimingTool shareNetworkTool] setTimingType:HDMediaTimingTypeNone];
//    [HDConfigResultModel clearAppStyle];
    
    
}

#pragma mark - HttpDNS加载方法
#pragma mark 通用加载
+ (void)loadHTTPDNSWithUrlStr:(NSString *)urlStr andSuccess:(void(^)(NSString *ipUrl))success Fail:(void(^)(void))fail {
    [HDSingleMethodTool loadHTTPDNSWithUrlStr:(NSString *)urlStr SwitchKey:@"httpdns" andSuccess:success Fail:fail];
}
#pragma mark 直播加载
+ (void)loadLiveHTTPDNSWithUrlStr:(NSString *)urlStr andSuccess:(void(^)(NSString *ipUrl))success Fail:(void(^)(void))fail {
    [HDSingleMethodTool loadHTTPDNSWithUrlStr:(NSString *)urlStr SwitchKey:@"livehttpdns" andSuccess:success Fail:fail];
}

+ (void)loadHTTPDNSWithUrlStr:(NSString *)urlStr SwitchKey:(NSString *)switchKey andSuccess:(void(^)(NSString *ipUrl))success Fail:(void(^)(void))fail {
    
    //如果不是hundun域名，不解析
    if (![[NSURL URLWithString:urlStr].host hasSuffix:@".hundun.cn"]) {
        if (fail) fail();
    }
    
//    HDThirdPartSettingsModel *httpdnsSettings = [SQDBTools db_queryThirdPartSettingsWithTitle:switchKey];
//    
//    //如果开启了httpdns
//    if (httpdnsSettings.on) {
//        
//        NSURL *tempURL = [NSURL URLWithString:urlStr];
//        NSString *ip = [[HttpDnsService sharedInstance] getIpByHostAsync:tempURL.host];
//        
//        if (ip) {
//            
//            NSRange hostFirstRange = [urlStr rangeOfString:tempURL.host];
//            
//            if (NSNotFound != hostFirstRange.location) {
//                NSString *newUrl = [urlStr stringByReplacingCharactersInRange:hostFirstRange withString:ip];
//                if (success) success(newUrl);
//            } else {
//                if (fail) fail();
//            }
//        } else {
//            if (fail) fail();
//        }
//    } else {
//        if (fail) fail();
//    }
}

+ (NSString *)combineCommonParasWithUrlString:(NSString *)webStr paras:(NSDictionary *)paras {
    BOOL hasValue = [webStr containsString:@"?"];
    BOOL hasParas = [webStr hasSuffix:@"&"];
    //组合成可以直接拼接外部参数和公共参数的字符串  可以直接articleId=""&courseId=""
    __block NSString *resultString;
    if (hasValue) {
        resultString = [NSString stringWithFormat:@"%@%@",webStr,hasParas?@"":@"&"];
    }else {
        resultString = [NSString stringWithFormat:@"%@?",webStr];
    }
    
    NSDictionary *combineParas = [self requestCommonParamsMergeWithParams:paras];
    
    [combineParas enumerateKeysAndObjectsUsingBlock:^(id  _Nonnull key, id  _Nonnull obj, BOOL * _Nonnull stop) {
        resultString = [resultString stringByAppendingString:[NSString stringWithFormat:@"%@=%@&",key,obj]];
    }];
    
    resultString = [resultString substringToIndex:resultString.length - 1];
    
    return resultString;
}

#pragma mark -- 将外部参数与公共参数合并
+ (NSDictionary *)requestCommonParamsMergeWithParams:(NSDictionary *)dictionary {
    NSMutableDictionary *destionationDict = [NSMutableDictionary dictionaryWithDictionary:dictionary];
    //使用公共参数合并同时覆盖外部参数中包含的公共参数,确保公共参数的完整.
    [destionationDict addEntriesFromDictionary:[self commonParams]];
    return destionationDict;
}

/**
 返回header的参数,其中必须为字符串,所以将内部integer参数转成string
 
 @return 参数字典.
 */
+ (NSDictionary *)headerValueDictionary {
    NSDictionary *dictionary = [self commonParams];
    NSMutableDictionary *valueDic = [NSMutableDictionary dictionary];
    [dictionary enumerateKeysAndObjectsUsingBlock:^(id  _Nonnull key, id  _Nonnull obj, BOOL * _Nonnull stop) {
        if (![obj isKindOfClass:[NSString class]]) {
            [valueDic setObject:[NSString stringWithFormat:@"%@",obj] forKey:key];
        }else {
            [valueDic setObject:obj forKey:key];
        }
    }];
    return valueDic;
}
@end
