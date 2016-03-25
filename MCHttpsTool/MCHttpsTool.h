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
 *  发送一个GET请求-返回的response类型是十六进制
 *
 *  @param url     请求路径
 *  @param params  请求参数
 *  @param success 请求成功后的回调（请将请求成功后想做的事情写到这个block中）
 *  @param failure 请求失败后的回调（请将请求失败后想做的事情写到这个block中）
 */
+ (void)get:(NSString *)url params:(NSDictionary *)params timeOut:(NSTimeInterval)timeInterval success:(void (^)(id responseObj))success failure:(void (^)(NSError *error))failure;


/**
 *  post请求-返回的response类型是十六进制
 *
 *  @param url     请求路径
 *  @param params  请求参数
 *  @param success 请求成功后的回调（请将请求成功后想做的事情写到这个block中）
 *  @param failure 请求失败后的回调（请将请求失败后想做的事情写到这个block中）
 */
+ (void)post:(NSString *)url params:(NSDictionary *)params timeOut:(NSTimeInterval)timeInterval success:(void (^)(id responseObj))success failure:(void (^)(NSError *error))failure;

/**
 *  当前的网络状态
 *
 *  @param networkStatus 网络状态的枚举
 */

+(void)networkReachabilituStatus:(void(^)(MCNetWorkStatus networkStatus))networkStatus;


#pragma mark-基于SDWebImage的下载图片封装
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
