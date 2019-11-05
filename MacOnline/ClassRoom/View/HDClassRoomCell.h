//
//  HDClassRoomCell.h
//  HDOnlineClassroom
//
//  Created by 王景伟 on 2019/9/3.
//  Copyright © 2019 王景伟. All rights reserved.
//

#import "HDTableViewCell.h"
#import "HDUserRoomListModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface HDClassRoomCell : HDTableViewCell

@property (nonatomic, assign) NSInteger row;

@property (nonatomic, strong) HDRoomModel *model;

@end

NS_ASSUME_NONNULL_END
