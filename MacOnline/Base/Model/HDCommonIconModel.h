//
//  HDCommonIconModel.h
//  yanxishe
//
//  Created by lwt on 2019/8/2.
//  Copyright © 2019 hundun. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface HDCommonIconModel : NSObject

///图片链接
@property (nonatomic, copy) NSString *imageUrl;

///宽高比
@property (nonatomic, assign) CGFloat scale;

///图片高度与15pt的比例
@property (nonatomic, assign) CGFloat heightScale;

@end

NS_ASSUME_NONNULL_END
