//
//  HDClassRoomUserListModel.m
//  HDOnlineClassroom
//
//  Created by 王景伟 on 2019/9/9.
//  Copyright © 2019 王景伟. All rights reserved.
//

#import "HDClassRoomUserListModel.h"

@implementation HDRoomUserModel
+ (NSDictionary *)modelCustomPropertyMapper {
    return @{@"userId" : @"user_id",
             @"stagePermission" : @"stage_permission",
             @"drawPermission" : @"draw_permission",
             @"speakPermission" : @"speak_permission",
             @"audioState" : @"voice_state",
             @"cameraState" : @"camera_state",
             @"transferUid" : @"transfer_uid",
             @"isOnline" : @"is_online",
             @"raiseHand" : @"hands_up",
             @"audioPermission" : @"voice_permission",
             @"cameraPermission" : @"camera_permission",
             };
}

- (CGFloat)nameW {
    if (!_nameW) {
        if ([NSString isBlankString:_name]) {
            return 0;
        }
        return [_name widthForFont:[NSFont systemFontOfSize:8]];
    }
    return 0;
}

- (void)setRole:(NSString *)role {
    _role = role;
    if ([role isEqualToString:@"MASTER"]) {
        self.userRole = HDUserMaster;
    } else if ([role isEqualToString:@"INTERACT"]) {
        self.userRole = HDUserInteract;
    }
}

@end

@implementation HDClassRoomUserListModel
+ (NSDictionary *)modelCustomPropertyMapper {
    return @{@"errorNumber" : @"error_no",
             @"errorMsg" : @"error_msg",
             @"roomUserList" : @"data.state_list",
             };
}

+ (NSDictionary *)modelContainerPropertyGenericClass {
    return @{@"roomUserList" : HDRoomUserModel.class};
}

@end
