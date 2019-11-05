//
//  HDUserRoomListModel.h
//  HDOnlineClassroom
//
//  Created by 王景伟 on 2019/9/2.
//  Copyright © 2019 王景伟. All rights reserved.
//

#import "HDBaseModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface HDRoomModel : NSObject
///<
@property (nonatomic, assign) NSInteger roomId;
///< 聊天室id
@property (nonatomic, copy) NSString *groupId;
///< 房间名称
@property (nonatomic, copy) NSString *roomName;
///< 状态 [未开始-READY，进行中-RUNNING，已完成-COMPLETE
@property (nonatomic, copy) NSString *state;
///< 封面
@property (nonatomic, copy) NSString *cover;
///< 老师名称
@property (nonatomic, copy) NSString *teacher;
///< 预计开始时间
@property (nonatomic, copy) NSString *expectStartTime;
///< 预计结束时间
@property (nonatomic, copy) NSString *expectEndTime;
///< 角色 [房主-MASTER, 互动人员-INTERACT
@property (nonatomic, copy) NSString *role;

@end

@interface HDUserRoomListModel : HDBaseModel

@property (nonatomic, strong) NSArray<HDRoomModel *> *roomList;

@end

NS_ASSUME_NONNULL_END
