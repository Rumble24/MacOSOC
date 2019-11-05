
//
//  HDCommonIconModel.m
//  yanxishe
//
//  Created by lwt on 2019/8/2.
//  Copyright © 2019 hundun. All rights reserved.
//

#import "HDCommonIconModel.h"

@implementation HDCommonIconModel

+ (NSDictionary *)modelCustomPropertyMapper {
    return @{
             @"imageUrl" : @"image_url",
             @"scale" : @"scale",
             @"heightScale" : @"height_scale",
             };
}

@end
