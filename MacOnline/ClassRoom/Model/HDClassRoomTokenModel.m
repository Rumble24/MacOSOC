//
//  HDClassRoomTokenModel.m
//  HDOnlineClassroom
//
//  Created by 王景伟 on 2019/9/3.
//  Copyright © 2019 王景伟. All rights reserved.
//

#import "HDClassRoomTokenModel.h"

@implementation HDClassRoomTokenModel
+ (NSDictionary *)modelCustomPropertyMapper {
    return @{@"errorNumber" : @"error_no",
             @"errorMsg" : @"error_msg",
             @"appId" : @"data.app_id",
             @"token" : @"data.token",
             @"uuid" : @"data.uuid",
             @"transferUid" : @"data.transfer_uid"
             };
}
@end
