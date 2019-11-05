//
//  HDUser.m
//  yanxishe
//
//  Created by Fly on 16/3/18.
//  Copyright © 2016年 hundun. All rights reserved.
//

#import "HDUserModel.h"
#import "NSObject+YYModel.h"

@implementation HDUserTitleListModel

+ (NSDictionary *)modelCustomPropertyMapper {
    return @{
             @"userTitleUrl" : @[@"user_title_url",@"title_url"],
             @"scale" : @"scale",
             @"heightScale" : @"height_scale",
             };
}

- (BOOL)modelCustomTransformFromDictionary:(NSDictionary *)dic {
    if (self.heightScale <= 0) {
        self.heightScale = 1.0;
    }
    return YES;
}

@end

@implementation HDUserSkuListModel

+ (NSDictionary *)modelCustomPropertyMapper {
    return @{
             @"skuMode" : @"sku_mode",
             @"skuName" : @"sku_name",
             @"userType" : @"user_type",
             @"semesterId" : @"semester_id",
             @"classId" : @"class_id",
             @"skuDialogMsg" : @"sku_dialog_msg",
             @"permIntercept" : @"perm_intercept",
             @"skuBuyEntrance" : @"sku_buy_entrance",
             @"classTitle" : @"class_title",
             };
}

@end

@implementation HDUserSessionModel

+ (NSDictionary *)modelCustomPropertyMapper {
    return @{
             @"token" : @"token",
             @"sid" : @"sid",
             };
}

@end


@implementation HDUserSpreadModel

+ (NSDictionary *)modelCustomPropertyMapper {
    return @{
             @"spreadPageUrl" : @"new_spread_page_url",
             @"tasteSpreadPageUrl" : @"taste_spread_page_url",
             @"openSkuImg" : @"open_sku_img",
             @"inviteTitle" : @"invite_title",
             @"openSkuTitle" : @"open_sku_title",
             @"skuSpreadSmallImg" : @"sku_spread_small_img",
             @"skuSpreadMainTitle" : @"sku_spread_main_title",
             @"skuSpreadSubTitle" : @"sku_spread_sub_title",
             @"tasteSpreadSmallImg" : @"taste_spread_small_img",
             @"tasteSpreadMainTitle" : @"taste_spread_main_title",
             @"tasteSpreadSubTitle" : @"taste_spread_sub_title",
             };
}

@end

@implementation HDUserMedalModel

+ (NSDictionary *)modelCustomPropertyMapper {
    return @{
             @"pageUrl" : @"page_url",
             };
}

@end

@implementation HDUserAdviserModel

+ (NSDictionary *)modelCustomPropertyMapper {
    return @{
             @"pageUrl" : @"page_url",
             };
}

@end

@implementation HDUserModel

/**
 *  返回一个Dict,将Model属性名映射到JSON的Key.
 *
 *  @return NSDictionary
 */
+ (NSDictionary *)modelCustomPropertyMapper {
    return @{
             @"ssliveText" : @"sslive.sslive_text",
             @"isSsliveAnchor" : @"sslive.is_sslive_anchor",
             @"sslivePageUrl" : @"sslive.sslive_page_url",
             @"tuanbaoUrl" : @"tuanbao_url",
             @"passwd" : @"passwd",
             @"uid" : @"uid",
             @"sex" : @"sex",
             @"headImg" : @"head_img",
             @"communityId":@"community_id",
             @"communityName":@"community_name",
             @"name" : @"name",
             @"classTitle":@"class_title",
             @"typeId" : @"type_id",
             @"studentNo" : @"student_no",
             @"applyScene" : @"apply_scene",
             @"industry" : @"industry",
             @"industryLevel2" : @"industry_level_2",
             @"position" : @"position",
             @"positionLevel" : @"position_level",
             @"company" : @"company",
             @"email" : @"email",
             @"province" : @"prov_name",
             @"city" : @"city_name",
             @"nickname" : @"nickname",
             @"weixin" : @"weixin",
             @"expireTimeDisplay" : @"expire_time_display",
             @"phone" : @"phone",
             @"openId" : @"openid",
             @"tpType" : @"tp_type",
             @"studyValue" : @"yanzhi",
             @"isGag" : @"is_gag",
             @"easemobUserid" : @"easemob_userid",
             @"easemobPasswd" : @"easemob_passwd",
             @"isExcellentClass" : @"in_excellent_class",
             @"expireTime" : @"expire_time",
             @"userTitleUrl" : @"user_title_url",
             @"userTitleId" : @"user_title_id",
             @"scale" : @"scale",
             @"creditTitle" : @"credit_title",
             @"isAssistant" : @"is_assistant",
             @"isSpeaker" : @"is_speaker",
             @"buyerOpenid" : @"buyer_openid",
             @"is7daysUser" : @"is_7days_user",
             @"in7daysPeriod" : @"in_7days_period",
             @"cxy18TipWording" : @"cxy18_tip_wording",
             @"yxsTipWording" :  @"yxs_tip_wording",
             @"isNeedBindPhone" : @"is_need_bind_phone",
             @"unionId" : @"unionid",
             @"yxsTipButton" : @"yxs_tip_button",
             @"easemobServiceTime" : @"easemob_service_time",
             @"mobileServiceTime" : @"mobile_service_time",
             @"periodWording" : @"period_wording",
             @"spreadWording" : @"spread_wording",
             @"skuList" : @"sku_list",
             @"ssFirstLoginTime" : @"ss_first_login_time",
             @"ssRegistTime" : @"ss_regist_time",
             @"ssYxsJoinTime" : @"ss_yxs_join_time",
             @"ssYxsExpireTime" : @"ss_yxs_expire_time",
             @"ssCxy18JoinTime" : @"ss_cxy18_join_time",
             @"ssCxy18ExpireTime" : @"ss_cxy18_expire_time",
             @"ssSxyJoinTime" : @"ss_sxy_join_time",
             @"ssSxyExpireTime" : @"ss_sxy_expire_time",
             @"session" : @"session",
             @"hasReceivedCard7" : @"has_received_card7",
             @"hasRobbedCourse" : @"has_robbed_course",
             @"enrollIcon" : @"enroll_icon",
             @"enrollWording" : @"enroll_wording",
             @"inviteIcon" : @"invite_icon",
             @"inviteWording" : @"invite_wording",
             @"intro" : @"intro",
             @"heightScale" : @"height_scale",
             @"isFill" : @"is_fill",
             @"userTitleList" : @"user_title_list",
             @"spreadInfo" : @"new_spread_info"
             };
}

+ (NSDictionary *)modelContainerPropertyGenericClass {
    return @{
             @"skuList" : [HDUserSkuListModel class],
             @"userTitleList" : [HDUserTitleListModel class],
             };
}

- (BOOL)modelCustomTransformFromDictionary:(NSDictionary *)dic {
    if (self.heightScale <= 0) {
        self.heightScale = 1.0;
    }
    return YES;
}


- (void)encodeWithCoder:(NSCoder *)aCoder { [self yy_modelEncodeWithCoder:aCoder]; }
- (id)initWithCoder:(NSCoder *)aDecoder { self = [super init]; return [self yy_modelInitWithCoder:aDecoder]; }
- (id)copyWithZone:(NSZone *)zone { return [self yy_modelCopy]; }
- (NSUInteger)hash { return [self yy_modelHash]; }
- (BOOL)isEqual:(id)object { return [self yy_modelIsEqual:object]; }
- (NSString *)description { return [self yy_modelDescription]; }


@end
