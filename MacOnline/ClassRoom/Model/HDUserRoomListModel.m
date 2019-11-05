//
//  HDUserRoomListModel.m
//  HDOnlineClassroom
//
//  Created by 王景伟 on 2019/9/2.
//  Copyright © 2019 王景伟. All rights reserved.
//

#import "HDUserRoomListModel.h"

@implementation HDRoomModel

+ (NSDictionary *)modelCustomPropertyMapper {
    return @{@"roomId" : @"room_id",
             @"expectStartTime" : @"expect_start_time",
             @"expectEndTime" : @"expect_end_time",
             @"groupId" : @"group_id",
             };
}

@end

@implementation HDUserRoomListModel

+ (NSDictionary *)modelCustomPropertyMapper {
    return @{@"errorNumber" : @"error_no",
             @"errorMsg" : @"error_msg",
             @"roomList" : @"data.room_list",
             };
}

+ (NSDictionary *)modelContainerPropertyGenericClass {
    return @{@"roomList" : HDRoomModel.class};
}

@end
