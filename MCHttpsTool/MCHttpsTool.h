//
//  MCHttpsTool.h
//  MCHttpsTool
//
//  Created by ZMC on 16/3/1.
//  Copyright © 2016年 Zmc. All rights reserved.
//
/**
 *  封装网络请求减少对第三方库的依赖,如果AFN不好用了,只要把该封装的工具类方法变化一下即可.
 */
#import <Foundation/Foundation.h>
#import "AFNetworking.h"
#import "UIImageView+WebCache.h"
/**
 *  网络状态的枚举
 */
typedef NS_ENUM(NSInteger, MCNetWorkStatus) {
    /**
     *  未知网路
     */
    MCNetWorkStatusUnknown          = -1,
    /**
     *  没有网络
     */
    MCNetWorkStatusNotReachable     = 0,
    /**
     *  手机自带网络
     */
    MCNetWorkStatusReachableViaWWAN = 1,
    /**
     *  WiFi
     */
    MCNetWorkStatusWiFi = 2,
};

@interface MCHttpsTool : NSObject
/**
 *  get请求
 *
 *  @param url     请求地址
 *  @param params  请求体
 *  @param success 成功后调用
 *  @param failure 失败后调用
 */
+ (void)getRequest:(NSString *)url params:(NSDictionary *)params success:(void (^)(id responseObject))success failure:(void (^)(NSError *error))failure timeoutInt:(NSTimeInterval)timeoutInt;


/**
 *  post请求
 *
 *  @param url     请求地址
 *  @param params  请求体
 *  @param success 成功后调用
 *  @param failure 失败后调用
 */
+ (void)postRequest:(NSString *)url params:(NSDictionary *)params success:(void (^)(id responseObject))success failure:(void (^)(NSError *error))failure timeoutInt:(NSTimeInterval)timeoutInt;

/**
 *  当前的网络状态
 *
 *  @param networkStatus 网络状态的枚举
 */

+(void)networkReachabilituStatus:(void(^)(MCNetWorkStatus networkStatus))networkStatus;
/**
 *  下载图片
 *
 *  @param url 下载地址
 */
+ (void) downLoadImage:(NSString*)urlString toImageView:(UIImageView*)imageView;
/**
 *  下载图片
 *
 *  @param url   下载地址
 *  @param image 默认图片
 */
+ (void) downLoadImage:(NSString *)urlString placeholderImgae:(UIImage*)image toImageView:(UIImageView*)imageView;
@end
