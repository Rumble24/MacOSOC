//
//  HDClassRoomPropModel.h
//  HDOnlineClassroom
//
//  Created by 王景伟 on 2019/9/3.
//  Copyright © 2019 王景伟. All rights reserved.
//

#import "HDBaseModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface HDClassRoomPropModel : HDBaseModel
///< 预计开始时间
@property (nonatomic, copy) NSString *expectStartTime;
///< 预计结束时间
@property (nonatomic, copy) NSString *expectEndTime;
///< 老师名称
@property (nonatomic, copy) NSString *teacher;
///< 封面
@property (nonatomic, copy) NSString *cover;
///< 房间名称
@property (nonatomic, copy) NSString *roomName;
///< 状态 [未开始-READY，进行中-RUNNING，已完成-COMPLETE]
@property (nonatomic, copy) NSString *state;
///< 实际开始时间
@property (nonatomic, copy) NSString *startTime;
///< 老实际结束时间
@property (nonatomic, copy) NSString *endTime;
@end


NS_ASSUME_NONNULL_END
