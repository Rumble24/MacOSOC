//
//  HDMessageModel.m
//  MacOnline
//
//  Created by 王景伟 on 2019/10/10.
//  Copyright © 2019 王景伟. All rights reserved.
//

#import "HDMessageModel.h"

@implementation HDMessageModel

+ (NSDictionary *)modelCustomPropertyMapper {
    return @{@"errorNo" : @"error_no",
             @"errorMsg" : @"error_msg",
             @"isNewPhone" : @"data.is_new_phone",
             @"userModel" : @"data",
    };
}

@end
