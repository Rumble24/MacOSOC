//
//  HDClassRoomUserListModel.h
//  HDOnlineClassroom
//
//  Created by 王景伟 on 2019/9/9.
//  Copyright © 2019 王景伟. All rights reserved.
//

#import "HDBaseModel.h"

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSUInteger, HDUserRole) {
    /**
     *  学生
     */
    HDUserInteract             = 1,
    /**
     *  老师
     */
    HDUserMaster               = 2,
};

@interface HDRoomUserModel : NSObject
///< 用户id
@property (nonatomic, copy) NSString *userId;
///< 用户名字
@property (nonatomic, copy) NSString *name;
///< 用户头像
@property (nonatomic, copy) NSString *avatar;
///< 角色 [房主-MASTER, 互动人员-INTERACT]
@property (nonatomic, copy) NSString *role;
///< 上下台， 0-下台，1-上台
@property (nonatomic, assign) NSInteger stagePermission;
///< 画板权限
@property (nonatomic, assign) NSInteger drawPermission;
///< 禁言
@property (nonatomic, assign) NSInteger speakPermission;
///< 麦克风
@property (nonatomic, assign) NSInteger audioState;
///< 摄像头
@property (nonatomic, assign) NSInteger cameraState;
///< 转换之后的user_id
@property (nonatomic, assign) NSInteger transferUid;
///< 转换之后的user_id
@property (nonatomic, assign) NSInteger isOnline;
///< 是否授权麦克风
@property (nonatomic, assign) NSInteger audioPermission;
///< 是否授权摄像头
@property (nonatomic, assign) NSInteger cameraPermission;

@property (nonatomic, assign) BOOL raiseHand;

///< 新增加的字段
@property (nonatomic, assign) CGFloat nameW;

@property (nonatomic, assign) HDUserRole userRole;

@end

@interface HDClassRoomUserListModel : HDBaseModel

@property (nonatomic, strong) NSArray<HDRoomUserModel *> *roomUserList;

@end

NS_ASSUME_NONNULL_END
