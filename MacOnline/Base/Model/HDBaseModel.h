//
//  HDBaseModel.h
//  yanxishe
//
//  Created by Fly on 16/5/3.
//  Copyright © 2016年 hundun. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HDBaseModel : NSObject

///< 错误码
@property (assign, nonatomic) NSInteger errorNumber;
///< 错误消息
@property (copy,   nonatomic) NSString *errorMsg;


@end
