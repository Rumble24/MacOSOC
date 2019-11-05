//
//  HDUserRoleModel.h
//  HDOnlineClassroom
//
//  Created by 王景伟 on 2019/9/3.
//  Copyright © 2019 王景伟. All rights reserved.
//

#import "HDBaseModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface HDUserRoleModel : HDBaseModel
///< 老师名称
@property (nonatomic, copy) NSString *role;
@end

NS_ASSUME_NONNULL_END
