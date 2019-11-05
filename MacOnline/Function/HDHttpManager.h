//
//  HDHttpManager.h
//  MacOnline
//
//  Created by 王景伟 on 2019/10/9.
//  Copyright © 2019 王景伟. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "HDBaseModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface HDHttpManager : NSObject

+ (HDHttpManager *)sharedInstance;
  
- (void)GET:(NSString *)URLString dict:(id)dict succeed:(void (^)(id data))succeed failure:(void (^)(NSString *errorMsg))failure;
  
- (void)POST:(NSString *)URLString dict:(id)dict succeed:(void (^)(id data))succeed failure:(void (^)(NSString *errorMsg))failure;

@end

NS_ASSUME_NONNULL_END
