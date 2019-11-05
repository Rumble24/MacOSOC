//
//  HDRoomMessageModel.h
//  AgoraMiniClass
//
//  Created by yangmoumou on 2019/6/23.
//  Copyright © 2019 yangmoumou. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSUInteger, HDCRMessageType) {
    /**
     *  基本消息文本
     */
    HDMessageText               = 1,
    /**
     *  上下台
     */
    HDMessageGoesOnOrOff        = 2,
    /**
     *  授权画板权限
     */
    HDMessageWhitePermission    = 3,
    /**
     *  禁言
     */
    HDMessagebanned             = 4,
    /**
     *  全体禁言
     */
    HDMessageAllbanned          = 5,
    /**
     *  移除成员
     */
    HDMessageRemoveMember       = 6,
    /**
     *  举手
     */
    HDMessageRaiseHands         = 7,
    /**
     *  麦克风状态
     */
    HDMessageAudioState         = 8,
    /**
     *  摄像头状态
     */
    HDMessageCameraState        = 9,
    /**
     *  邀请其他人加入
     */
    HDMessageJoinMember         = 10,
    /**
     *  全体学生静音
     */
    HDMessageAllAudioMute       = 11,
    /**
     *  全体学生上下台
     */
    HDMessageAllGoesOnOrOff     = 12,
    /**
     *  全体用户画板权限
     */
    HDMessageAllWhitePermission = 13,
    /**
     *  麦克风权限
     */
    HDMessageAudioPermission    = 14,
    /**
     *  摄像头权限
     */
    HDMessageCameraPermission   = 15,
    /**
     *  用户上下线
     */
    HDMessageUserOnOrOutline    = 101,
    /**
     *  自测题
     */
    HDMessageUserTestQuestions  = 102,
    /**
     *  老师停止自测题 展示结果
     */
    HDMessageUserQuestionResult = 104,
    /**
     *  学生提交答案
     */
    HDMessageUserSubmitAnswer   = 105,
    /**
     *  码率监控
     */
    HDMessageBitRate            = 110,
};

NS_ASSUME_NONNULL_BEGIN

@interface HDAnswerDistributionModel : NSObject
///<  答案
@property (nonatomic,   copy) NSString *answer;
///<  名字
@property (nonatomic, strong) NSArray *uname;
///<  答案百分比
@property (nonatomic,   copy) NSString *percentage;
///<  画圆百分比
@property (nonatomic,   copy) NSString *displayPercentage;
@end

@interface HDRoomMessageModel : NSObject
///<  消息类型
@property (nonatomic, assign) HDCRMessageType type;
///<  用户id
@property (nonatomic,   copy) NSString *userId;
///<  用户名字
@property (nonatomic,   copy) NSString *userName;
///<  用户头像
@property (nonatomic,   copy) NSString *userAvatar;
///<  时间戳
@property (nonatomic, assign) NSInteger timeStamp;
///<  消息版本
@property (nonatomic, assign) NSInteger messageVersion;
///<  消息内容
@property (nonatomic,   copy) NSString *content;
///<  目标id
@property (nonatomic,   copy) NSString *targetUserId;
///<  状态  0：禁用 1 ：开启
@property (nonatomic, assign) NSInteger state;
///<  状态  0：禁用 1 ：开启
@property (nonatomic, strong) NSArray<NSString *> *excludeUserId;

//////////////////自测题
///< 0: 单选题 1: 多选题
@property (nonatomic, assign) NSInteger kind;
///< 选项
@property (nonatomic, strong) NSArray *choice;
///< 对应的正确答案
@property (nonatomic, strong) NSArray *answer;


//////////////////自测题统计
///< 投票人数
@property (nonatomic,   copy) NSString *voteNum;
///< 正确答案
@property (nonatomic,   copy) NSString *correctAnswer;
///< 正确率
@property (nonatomic,   copy) NSString *correctRate;
///< 投票分布
@property (nonatomic, strong) NSArray<HDAnswerDistributionModel *> *distribution;


//////////////////自定义参数
///<  用户id
@property (nonatomic, assign) BOOL isTeacther;
///<  用户id
@property (nonatomic, assign) CGFloat cellH;
///< 选择题使用参数
@property (nonatomic, assign) BOOL selected;
@end

NS_ASSUME_NONNULL_END
