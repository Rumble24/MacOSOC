//
//  HDFunctionPch.h
//  HDOnlineClassroom
//
//  Created by 王景伟 on 2019/9/2.
//  Copyright © 2019 王景伟. All rights reserved.
//

#ifndef HDFunctionPch_h
#define HDFunctionPch_h

#define URL(string)    [NSURL URLWithString:STRING_NIL(string)]  //字符串转换成url

#define RGB(A, B, C) [NSColor colorWithRed:A/255.0 green:B/255.0 blue:C/255.0 alpha:1.0]

///< 为空字符串保护
#define STRING_NIL(string) (string = ([string isKindOfClass:[NSString class]] ? ([(NSString *)string length]?string:@"") : ([string isKindOfClass:[NSNumber class]] ? [(NSNumber *)string stringValue] :@"")))

#define HDUID STRING_NIL([HDAccountTool account].uid)//获取uid

#define HDISLOGINSTRONG (HDUID.length && ![[HDAccountTool account].tpType isEqualToString:@"imei"])//是否登录

#ifndef weakify
#if DEBUG
#if __has_feature(objc_arc)
#define weakify(object) autoreleasepool{} __weak __typeof__(object) weak##_##object = object;
#else
#define weakify(object) autoreleasepool{} __block __typeof__(object) block##_##object = object;
#endif
#else
#if __has_feature(objc_arc)
#define weakify(object) try{} @finally{} {} __weak __typeof__(object) weak##_##object = object;
#else
#define weakify(object) try{} @finally{} {} __block __typeof__(object) block##_##object = object;
#endif
#endif
#endif

#ifndef strongify
#if DEBUG
#if __has_feature(objc_arc)
#define strongify(object) autoreleasepool{} __typeof__(object) object = weak##_##object;
#else
#define strongify(object) autoreleasepool{} __typeof__(object) object = block##_##object;
#endif
#else
#if __has_feature(objc_arc)
#define strongify(object) try{} @finally{} __typeof__(object) object = weak##_##object;
#else
#define strongify(object) try{} @finally{} __typeof__(object) object = block##_##object;
#endif
#endif
#endif

#endif /* HDFunctionPch_h */
