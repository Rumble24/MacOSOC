//
//  HDUserRoleModel.m
//  HDOnlineClassroom
//
//  Created by 王景伟 on 2019/9/3.
//  Copyright © 2019 王景伟. All rights reserved.
//

#import "HDUserRoleModel.h"

@implementation HDUserRoleModel
+ (NSDictionary *)modelCustomPropertyMapper {
    return @{@"errorNumber" : @"error_no",
             @"errorMsg" : @"error_msg",
             };
}
@end
