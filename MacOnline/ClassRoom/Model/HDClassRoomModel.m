//
//  HDClassRoomModel.m
//  HDOnlineClassroom
//
//  Created by 王景伟 on 2019/9/3.
//  Copyright © 2019 王景伟. All rights reserved.
//

#import "HDClassRoomModel.h"

@implementation HDClassRoomModel

+ (NSDictionary *)modelCustomPropertyMapper {
    return @{@"errorNumber" : @"error_no",
             @"errorMsg" : @"error_msg",
             @"roomId" : @"data.room_id",
             };
}
@end
