//
//  HDUser.h
//  yanxishe
//
//  Created by Fly on 16/3/18.
//  Copyright © 2016年 hundun. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "HDCommonIconModel.h"

@interface HDUserTitleListModel : NSObject

@property (nonatomic, copy) NSString *userTitleUrl;

@property (nonatomic, assign) CGFloat scale;

@property (nonatomic, assign) CGFloat heightScale;


////<2.15.0 勋章添加字段。如果以后勋章需要删除 下面字段e可以删除
/** 跳转的路由链接 是否展示有这个字段是否为空来判断*/
@property (nonatomic,   copy) NSString *pageUrl;
/** 勋章文案 */
@property (nonatomic,   copy) NSString *wording;

@end

@interface HDUserSkuListModel : NSObject

/** skuMode */
@property (nonatomic, copy) NSString *skuMode;

/** sku名称 */
@property (nonatomic, copy) NSString *skuName;

/** sku身份类型 普通社员，7天体验卡用户等 */
@property (nonatomic, copy) NSString *userType;

/** 班期ID */
@property (nonatomic, assign) int64_t semesterId;

/** 班级ID */
@property (nonatomic, copy) NSString *classId;

/** 班级标题 */
@property (nonatomic, copy) NSString *classTitle;

/** 是否走判断逻辑，1走，2不走 */
@property (nonatomic, assign) NSInteger permIntercept;

/** sku购买链接 */
@property (nonatomic, copy) NSString *skuBuyEntrance;

/** 权限拦截提示信息 */
@property (nonatomic, copy) NSString *skuDialogMsg;

@end

@interface HDUserSessionModel : NSObject

/** token 用于加密的密钥 */
@property (nonatomic, copy) NSString *token;

/** 会话id 用于放请求 header 里面 */
@property (nonatomic, copy) NSString *sid;

@end


///< 付费推广大使  体验推广大使
@interface HDUserSpreadModel : NSObject
/** 新版推广大使路由 */
@property (nonatomic, copy) NSString *spreadPageUrl;
/** 体验包推广大使路由 */
@property (nonatomic, copy) NSString *tasteSpreadPageUrl;
/** 邀请标题 */
@property (nonatomic, copy) NSString *inviteTitle;
/** 开通学籍长图 */
@property (nonatomic, copy) NSString *openSkuImg;
/** 开通学籍标题 */
@property (nonatomic, copy) NSString *openSkuTitle;
/** 付费推广大使小图 */
@property (nonatomic, copy) NSString *skuSpreadSmallImg;
/** 付费推广大使主标题 */
@property (nonatomic, copy) NSString *skuSpreadMainTitle;
/** 付费推广大使副标题 */
@property (nonatomic, copy) NSString *skuSpreadSubTitle;
/** 体验推广大使小图 */
@property (nonatomic, copy) NSString *tasteSpreadSmallImg;
/** 体验推广大使主标题 */
@property (nonatomic, copy) NSString *tasteSpreadMainTitle;
/** 体验推广大使副标题 */
@property (nonatomic, copy) NSString *tasteSpreadSubTitle;
@end

@interface HDUserMedalModel : NSObject
/** 跳转的路由链接 是否展示有这个字段是否为空来判断*/
@property (nonatomic,   copy) NSString *pageUrl;
/** 勋章文案 */
@property (nonatomic,   copy) NSString *wording;
@property (nonatomic, strong) HDCommonIconModel *icon;
@end

@interface HDUserAdviserModel : NSObject
/** 跳转的路由链接 是否展示有这个字段是否为空来判断*/
@property (nonatomic,   copy) NSString *pageUrl;
/** 勋章文案 */
@property (nonatomic,   copy) NSString *title;
@end

@interface HDUserModel : NSObject

/** 开启直播入口 */
@property (copy, nonatomic) NSString *ssliveText;
/** 开启直播跳转h5字段 */
@property (assign, nonatomic) BOOL isSsliveAnchor;
/** 开启直播h5链接 */
@property (copy, nonatomic) NSString *sslivePageUrl;

/** 团报URL */
@property (copy, nonatomic) NSString *tuanbaoUrl;

/** 用户帐号加密的密码 */
@property (copy, nonatomic) NSString *passwd;

/** 用户id */
@property (copy, nonatomic) NSString *uid;

/** 用户性别 0-未知 1-男 2-女 */
@property (assign, nonatomic) NSInteger sex;

/** 头像 */
@property (copy, nonatomic) NSString *headImg;

/** 个人总分社id */
@property (nonatomic, copy) NSString *communityId;

/** 个人总分社名称 */
@property (nonatomic, copy) NSString *communityName;

/** 用户名字 */
@property (copy, nonatomic) NSString *name;

/** 学号 */
@property (copy, nonatomic) NSString *studentNo;

/** <#描述#> */
@property (assign, nonatomic) int16_t applyScene;

/** 用户所在行业 */
@property (copy, nonatomic) NSString *industry;

/** 用户所在二级行业 */
@property (copy, nonatomic) NSString *industryLevel2;

/** 用户的工作职位 */
@property (copy, nonatomic) NSString *position;

/** 用户职级 */
@property (copy, nonatomic) NSString *positionLevel;

/** 用户所在的公司名称 */
@property (copy, nonatomic) NSString *company;

/** 用户所在的公司邮箱 */
@property (copy, nonatomic) NSString *email;

/** 省份 */
@property (copy, nonatomic) NSString *province;

/** 城市 */
@property (copy, nonatomic) NSString *city;

/** 昵称 */
@property (copy, nonatomic) NSString *nickname;

/** 用户微信帐号 */
@property (copy, nonatomic) NSString *weixin;

/** 学员过期时间 */
@property (copy, nonatomic) NSString *expireTimeDisplay;

/** 手机号 */
@property (copy, nonatomic) NSString *phone;

/** 是否被禁言 */
@property (nonatomic,assign)NSInteger is_gag;

/** 用户的研值数 */
@property (nonatomic,copy)NSString * studyValue;

/** 第三方帐号的openid */
@property (copy, nonatomic) NSString *openId;

/** 第三方帐号类型 */
@property (copy, nonatomic) NSString *tpType;

/** 环信账号id */
@property (copy, nonatomic) NSString *easemobUserid;

/** 环信账号密码 */
@property (copy, nonatomic) NSString *easemobPasswd;

/** 用户是否属于优秀班级 */
@property (nonatomic, assign) BOOL isExcellentClass;

/** 到期时间 */
@property (nonatomic, assign) NSInteger expireTime;

/** 用户身份 */
@property (nonatomic, copy) NSString *userTitleUrl;

/** 用户班级信息 */
@property (nonatomic, copy) NSString *classTitle;

/** 身份类型 */
@property (nonatomic, assign) NSInteger userTitleId;

/** 身份类型图片宽高比 */
@property (nonatomic, assign) float scale;

/** 用户身份图片高度与15pt的比例 */
@property (nonatomic, assign) float heightScale;

/** 学位信息 */
@property (nonatomic, copy) NSString *creditTitle;

/** 是否为助教 */
@property (nonatomic, assign) BOOL isAssistant;

/** 是否为主讲 */
@property (nonatomic, assign) BOOL isSpeaker;

/** guanaitong openid 2.3.1 */
@property (nonatomic, copy) NSString *buyerOpenid;

/** 是否是7天体验券的人(新) 2.3.6 */
@property (nonatomic, assign) NSInteger is7daysUser;

/** 是否在7天体验期(新+老) 2.4.0 */
@property (nonatomic, assign) BOOL in7daysPeriod;

/** 创新院展示区提示文案 2.4.0 */
@property (nonatomic, copy) NSString *cxy18TipWording;

/** 研习社展示区提示文案 2.4.0 */
@property (nonatomic, copy) NSString *yxsTipWording;

/** 是否需要绑定手机号 0不需要 1需要则弹出绑定手机号页面 */
@property (nonatomic, assign) NSInteger isNeedBindPhone;

/** 第三方unionid */
@property (nonatomic, copy) NSString *unionId;

/** 个人中心按钮文案 */
@property (nonatomic, copy) NSString *yxsTipButton;

/** 在线咨询服务时间，用于个人中心显示 */
@property (nonatomic, copy) NSString *easemobServiceTime;

/** 电话客服服务时间，用于个人中心显示 */
@property (nonatomic, copy) NSString *mobileServiceTime;

/** skuList用户社员身份树形图 */
@property (nonatomic, strong) NSArray<HDUserSkuListModel *> *skuList;

#pragma mark 神策需要埋点
/** 首次登录时间 */
@property (nonatomic, copy) NSString *ssFirstLoginTime;

/** 注册时间 */
@property (nonatomic, copy) NSString *ssRegistTime;

/** 研习社加入时间 */
@property (nonatomic, copy) NSString *ssYxsJoinTime;

/** 研习社过期时间 */
@property (nonatomic, copy) NSString *ssYxsExpireTime;

/** 创新院加入时间 */
@property (nonatomic, copy) NSString *ssCxy18JoinTime;

/** 创新院过期时间 */
@property (nonatomic, copy) NSString *ssCxy18ExpireTime;

/** 商学院加入时间 */
@property (nonatomic, copy) NSString *ssSxyJoinTime;

/** 商学院过期时间 */
@property (nonatomic, copy) NSString *ssSxyExpireTime;

/** 是否领过7天卡 */
@property (nonatomic, assign) int hasReceivedCard7;

/** 是否抢过课 */
@property (nonatomic, assign) int hasRobbedCourse;

/** 个人简介 */
@property (nonatomic, copy) NSString *intro;

/** 资料是否完整 0=未完善 1=已完善 */
@property (nonatomic, assign) NSInteger isFill;

#pragma mark - 验证信息
@property (nonatomic, strong) HDUserSessionModel *session;

#pragma mark - 开通学籍和邀请好友文案设置

/** 开通学籍图标 */
@property (nonatomic, copy) NSString *enrollIcon;
/** 开通学籍主标题 */
@property (nonatomic, copy) NSString *enrollWording;
/** 开通学籍下方文案 */
@property (nonatomic, copy) NSString *periodWording;

/** 邀请好友图标 */
@property (nonatomic, copy) NSString *inviteIcon;
/** 邀请好友主标题 */
@property (nonatomic, copy) NSString *inviteWording;
/** 邀请好友下方文案 */
@property (nonatomic, copy) NSString *spreadWording;

/** 用户身份数组 */
@property (nonatomic, strong) NSArray<HDUserTitleListModel *> *userTitleList;


///< 2.15.0 推广大使
@property (nonatomic, strong) HDUserSpreadModel *spreadInfo;
///< 2.15.0 勋章
@property (nonatomic, strong) HDUserMedalModel *medal;
///< 2.15.0 专属班主任
@property (nonatomic, strong) HDUserAdviserModel *adviser;

@end
