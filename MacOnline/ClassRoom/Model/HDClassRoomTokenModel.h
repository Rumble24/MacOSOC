//
//  HDClassRoomTokenModel.h
//  HDOnlineClassroom
//
//  Created by 王景伟 on 2019/9/3.
//  Copyright © 2019 王景伟. All rights reserved.
//

#import "HDBaseModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface HDClassRoomTokenModel : HDBaseModel
///< 老师名称
@property (nonatomic, copy) NSString *appId;
///< 老师名称
@property (nonatomic, copy) NSString *token;
///< 老师名称
@property (nonatomic, copy) NSString *uuid;
///< 转换成数字之后的user_id
@property (nonatomic, assign) NSInteger transferUid;
@end

NS_ASSUME_NONNULL_END
