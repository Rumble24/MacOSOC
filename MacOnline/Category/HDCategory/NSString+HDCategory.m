//
//  NSString+HDCategory.m
//  yanxishe
//
//  Created by 王健鹏 on 2017/7/14.
//  Copyright © 2017年 hundun. All rights reserved.
//

#import "NSString+HDCategory.h"

@implementation NSString (HDCategory)

- (BOOL)isMobileNumber {
    return YES;
}

+ (BOOL)isBlankString:(NSString *)str {
    if (![str isKindOfClass:[NSString class]]) {
        return YES;
    }
    if (!str) {
        return YES;
    }
    if ([str isKindOfClass:[NSNull class]]) {
        return YES;
    }
    NSCharacterSet *set = [NSCharacterSet whitespaceAndNewlineCharacterSet];
    NSString *trimmedStr = [str stringByTrimmingCharactersInSet:set];
    if (!trimmedStr.length) {
        return YES;
    }
    return NO;
}

@end
