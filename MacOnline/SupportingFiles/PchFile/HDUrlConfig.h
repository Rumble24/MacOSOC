//
//  HDUrlConfig.h
//  HDOnlineClassroom
//
//  Created by 王景伟 on 2019/8/30.
//  Copyright © 2019 王景伟. All rights reserved.
//

#ifndef HDUrlConfig_h
#define HDUrlConfig_h

#define kCacheTimeInSeconds 0.5 //网络请求缓存时间

#define kHttpHostWithUrl(url) [NSString stringWithFormat:@"http://%@", url.length?url:url]
#define kHttpsHostWithUrl(url) [NSString stringWithFormat:@"https://%@", url.length?url:url]

#define kDisasterDomain @"tzhibo.hundun.cn/"


#define kClassDomain (kCurrentDomainUrlWithUrl(@"tclass.hundun.cn/",@"tclass.hundun.cn/",@""))
#define kClassDomainUrlWithPath(path) ([NSString stringWithFormat:@"%@%@", kClassDomain, path])


#define kUserDomain (kCurrentDomainUrlWithUrl(@"user.hundun.cn/",@"tuser.hundun.cn/",@"preuser.hundun.cn/"))
#define kUserDomainUrlWithPath(path) ([NSString stringWithFormat:@"%@%@", kUserDomain, path])



#pragma mark - 网络域名合成方法
///传入三个链接，内部取网络环境变量生成当前链接
#define kCurrentDomainUrlWithUrl(releaseUrl,debugUrl,preUrl) (\
(NSString *)(^(){\
if (HDSingleMethodToolDefault.productNetworkType == HDProductNetworkTypeRelease) {\
            return kHttpsHostWithUrl(releaseUrl);\
        } else if (HDSingleMethodToolDefault.productNetworkType == HDProductNetworkTypeDebug) {\
            return kHttpsHostWithUrl(debugUrl);\
        } else if (HDSingleMethodToolDefault.productNetworkType == HDProductNetworkTypePre) {\
            return preUrl.length?kHttpsHostWithUrl(preUrl):kHttpsHostWithUrl(releaseUrl);\
        } else if (HDSingleMethodToolDefault.productNetworkType == HDProductNetworkTypeDisaster) {\
            return kHttpsHostWithUrl(kDisasterDomain);\
        } else {\
            return releaseUrl;\
        }\
    }())\
)


//-------------------登录注册-----------------------//

///< 手机帐号注册
#define kRegist                         kUserDomainUrlWithPath(@"regist")
///< 登录
#define kLogin                          kUserDomainUrlWithPath(@"login")
///< 设置密码
#define kSetPasswd                      kUserDomainUrlWithPath(@"set_passwd")
///< 获取验证码
#define kGetInentifyCode                kUserDomainUrlWithPath(@"get_identify_code")
///< 三方登录
#define kThirdPartyLogin                kUserDomainUrlWithPath(@"thirdparty_login")
///< 验证码登录
#define kIdentifyCodeLogin              kUserDomainUrlWithPath(@"identify_code_login")
///< 获取国家地区
#define kUserCountryList                kUserDomainUrlWithPath(@"app/user_country_list")
///< 获取imei
#define kGetImeiUid                     kUserDomainUrlWithPath(@"get_imei_uid")



//-------------------用户-----------------------//
///< 获取用户权限 里面有直播间列表
#define kGetUserRoomList                kClassDomainUrlWithPath(@"classroom_online/user/room_list")
///< 获取用户角色
#define kGetUserRole                    kClassDomainUrlWithPath(@"classroom_online/user/role")
///< 设置用户角色
#define kPostUserRole                   kClassDomainUrlWithPath(@"classroom_online/user/role")



//-------------------房间-----------------------//
///< 创建房间
#define kPostCreateRoom                 kClassDomainUrlWithPath(@"classroom_online/room")
///< 获取房间token
#define kGetRoomToken                   kClassDomainUrlWithPath(@"classroom_online/room/token")
///< 获取房间的属性
#define kGetRoomProp                    kClassDomainUrlWithPath(@"classroom_online/room/prop")
///< 设置房间权限
#define kPostRoomPermission             kClassDomainUrlWithPath(@"classroom_online/room/permission")
///< 设置房间的属性
#define kPostRoomProp                   kClassDomainUrlWithPath(@"classroom_online/room/prop")
///< 获取当前房间所有的用户及状态
#define kGetRoomUser                    kClassDomainUrlWithPath(@"classroom_online/room/user")
///< 用户发送消息
#define kPostUserMsg                    kClassDomainUrlWithPath(@"classroom_online/user/msg")
///< 用户发送加入或者退出群聊
#define kPostUserGroup                  kClassDomainUrlWithPath(@"classroom_online/user/group")


#endif /* HDUrlConfig_h */
