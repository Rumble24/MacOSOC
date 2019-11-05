//
//  HDHttpManager.m
//  MacOnline
//
//  Created by 王景伟 on 2019/10/9.
//  Copyright © 2019 王景伟. All rights reserved.
//

#import "HDHttpManager.h"

@implementation HDHttpManager
/**
 *  创建网络请求类的单例
 */
static HDHttpManager *httpRequest = nil;
+(HDHttpManager *)sharedInstance
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        if (httpRequest == nil) {
            httpRequest = [[self alloc] init];
        }
    });
    return httpRequest;
}
+(instancetype)allocWithZone:(struct _NSZone *)zone
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        if (httpRequest == nil) {
            httpRequest = [super allocWithZone:zone];
        }
    });
    return httpRequest;
}
-(instancetype)copyWithZone:(NSZone *)zone
{
    return httpRequest;
}
/**
 *封装AFN的GET请求
 *@param URLString 网络请求地址
 *@param dict      参数(可以是字典或者nil)
 *@param succeed   成功后执行success block
 *@param failure   失败后执行failure block
 */
- (void)GET:(NSString *)URLString dict:(id)dict succeed:(void (^)(id data))succeed failure:(void (^)(NSString *errorMsg))failure {
    //创建网络请求管理对象
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    //申明返回的结果是json类型
    manager.responseSerializer = [AFJSONResponseSerializer serializer];
    //申明请求的数据是json类型
    manager.requestSerializer = [AFJSONRequestSerializer serializer];
    //如果报接受类型不一致请替换一致text/html或别的
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json", @"text/json", @"text/javascript", @"text/html", @"text/xml", @"text/plain", nil];
    
    NSMutableDictionary *destionationDict = [NSMutableDictionary dictionary];
    if (dict) {
        [destionationDict addEntriesFromDictionary:[HDSingleMethodTool commonParams]];
        [destionationDict addEntriesFromDictionary:dict];
    } else {
        [destionationDict addEntriesFromDictionary:[HDSingleMethodTool commonParams]];
    }
    
    //发送网络请求(请求方式为GET)
    [manager GET:URLString parameters:destionationDict progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        succeed(responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        failure(@"网络出错");
    }];
}
/**
 *  封装AFN的POST请求
 *
 *  @param URLString 网络请求地址
 *  @param dict      参数(可以是字典或者nil)
 *  @param succeed   成功后执行success block
 *  @param failure   失败后执行failure block
 */
- (void)POST:(NSString *)URLString dict:(id)dict succeed:(void (^)(id data))succeed failure:(void (^)(NSString *errorMsg))failure
{
    //创建网络请求管理对象
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    //申明返回的结果是json类型
    manager.responseSerializer = [AFJSONResponseSerializer serializer];
    //申明请求的数据是json类型
    manager.requestSerializer = [AFJSONRequestSerializer serializer];
    //如果报接受类型不一致请替换一致text/html或别的
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json", @"text/json", @"text/javascript", @"text/html", @"text/xml", @"text/plain", nil];
    
    NSMutableDictionary *destionationDict = [NSMutableDictionary dictionary];
    if (dict) {
        [destionationDict addEntriesFromDictionary:[HDSingleMethodTool commonParams]];
        [destionationDict addEntriesFromDictionary:dict];
    } else {
        [destionationDict addEntriesFromDictionary:[HDSingleMethodTool commonParams]];
    }
    
    //发送网络请求(请求方式为POST)
    [manager POST:URLString parameters:destionationDict progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        succeed(responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        failure(@"网络出错");
    }];
}
@end
