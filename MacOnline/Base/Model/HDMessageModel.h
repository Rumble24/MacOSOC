//
//  HDMessageModel.h
//  MacOnline
//
//  Created by 王景伟 on 2019/10/10.
//  Copyright © 2019 王景伟. All rights reserved.
//

#import "HDBaseModel.h"
#import "HDUserModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface HDMessageModel : HDBaseModel

@property (nonatomic, assign) NSInteger isNewPhone;

///<  登录结果模块
@property (strong, nonatomic) HDUserModel *userModel;
@end

NS_ASSUME_NONNULL_END
