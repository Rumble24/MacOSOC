//
//  NSString+HDCategory.h
//  yanxishe
//
//  Created by 王健鹏 on 2017/7/14.
//  Copyright © 2017年 hundun. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (HDCategory)

- (BOOL)isMobileNumber;

+ (BOOL)isBlankString:(NSString *)str;

@end
