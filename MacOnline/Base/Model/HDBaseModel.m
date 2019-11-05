//
//  HDBaseModel.m
//  yanxishe
//
//  Created by Fly on 16/5/3.
//  Copyright © 2016年 hundun. All rights reserved.
//

#import "HDBaseModel.h"

@implementation HDBaseModel

+ (NSDictionary *)modelCustomPropertyMapper {
    return @{
             @"errorNumber" : @"error_no",
             @"errorMsg" : @"error_msg",
             };
}

@end
