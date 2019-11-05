//
//  HDRoomMessageModel.m
//  AgoraMiniClass
//
//  Created by yangmoumou on 2019/6/23.
//  Copyright © 2019 yangmoumou. All rights reserved.
//

#import "HDRoomMessageModel.h"

@implementation HDAnswerDistributionModel

+ (NSDictionary *)modelCustomPropertyMapper {
    return @{
             @"displayPercentage" : @"display_percentage",
             };
}

@end

@implementation HDRoomMessageModel

+ (NSDictionary *)modelCustomPropertyMapper {
    return @{@"userAvatar" : @"user_avatar",
             @"userName" : @"user_name",
             @"timeStamp" : @"time_stamp",
             @"userId" : @"user_id",
             @"targetUserId" : @"target_user_id",
             @"voteNum" : @"vote_num",
             @"correctAnswer" : @"correct_answer",
             @"correctRate" : @"correct_rate",
             @"excludeUserId" : @"exclude_user_id"
             };
}

+ (NSDictionary *)modelContainerPropertyGenericClass {
    return @{
             @"distribution" : [HDAnswerDistributionModel class],
             };
}


- (CGFloat)cellH {
    if (_cellH == 0) {
        NSDictionary *attributes = @{NSFontAttributeName:[NSFont systemFontOfSize:15]};
        CGSize textRect = CGSizeMake(190, MAXFLOAT);
        CGFloat textHeight = [self.content boundingRectWithSize:textRect
                                            options:NSStringDrawingUsesLineFragmentOrigin|NSStringDrawingUsesFontLeading
                                                        attributes:attributes
                                                           context:nil].size.height;
        _cellH = textHeight + 44 + 10;
    }
    return _cellH;
}

@end
