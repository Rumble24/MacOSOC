//
//  HDClassRoomPropModel.m
//  HDOnlineClassroom
//
//  Created by 王景伟 on 2019/9/3.
//  Copyright © 2019 王景伟. All rights reserved.
//

#import "HDClassRoomPropModel.h"

@implementation HDClassRoomPropModel
+ (NSDictionary *)modelCustomPropertyMapper {
    return @{@"errorNumber" : @"error_no",
             @"errorMsg" : @"error_msg",
             @"expectStartTime" : @"data.expect_start_time",
             @"expectEndTime" : @"data.expect_end_time",
             @"roomName" : @"data.room_name",
             @"startTime" : @"data.start_time",
             @"endTime" : @"data.end_time",
             };
}
@end
