//
//  YYCategories.h
//  YYCategories <https://github.com/ibireme/YYCategories>
//
//  Created by ibireme on 13/3/29.
//  Copyright (c) 2015 ibireme.
//
//  This source code is licensed under the MIT-style license found in the
//  LICENSE file in the root directory of this source tree.
//

#import <AppKit/AppKit.h>

#if __has_include(<YYCategories/YYCategories.h>)
FOUNDATION_EXPORT double YYCategoriesVersionNumber;
FOUNDATION_EXPORT const unsigned char YYCategoriesVersionString[];
#import <YYCategories/YYCategoriesMacro.h>
#import <YYCategories/NSObject+YYAdd.h>
#import <YYCategories/NSObject+YYAddForKVO.h>
#import <YYCategories/NSObject+YYAddForARC.h>
#import <YYCategories/NSData+YYAdd.h>
#import <YYCategories/NSString+YYAdd.h>
#import <YYCategories/NSArray+YYAdd.h>
#import <YYCategories/NSDictionary+YYAdd.h>
#import <YYCategories/NSDate+YYAdd.h>
#import <YYCategories/NSNumber+YYAdd.h>
#import <YYCategories/NSNotificationCenter+YYAdd.h>
#import <YYCategories/NSKeyedUnarchiver+YYAdd.h>
#import <YYCategories/NSTimer+YYAdd.h>
#import <YYCategories/NSThread+YYAdd.h>
#else
#import "YYCategoriesMacro.h"
#import "NSObject+YYAdd.h"
#import "NSObject+YYAddForKVO.h"
#import "NSObject+YYAddForARC.h"
#import "NSData+YYAdd.h"
#import "NSString+YYAdd.h"
#import "NSArray+YYAdd.h"
#import "NSDictionary+YYAdd.h"
#import "NSDate+YYAdd.h"
#import "NSNumber+YYAdd.h"
#import "NSNotificationCenter+YYAdd.h"
#import "NSKeyedUnarchiver+YYAdd.h"
#import "NSTimer+YYAdd.h"
#import "NSThread+YYAdd.h"
#endif

