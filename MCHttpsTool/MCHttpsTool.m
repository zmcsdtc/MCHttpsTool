//
//  MCHttpsTool.m
//  MCHttpsTool
//
//  Created by ZMC on 16/3/1.
//  Copyright © 2016年 Zmc. All rights reserved.
//

#import "MCHttpsTool.h"

@implementation MCHttpsTool
+ (void)get:(NSString *)url params:(NSDictionary *)params success:(void (^)(id responseObj))success failure:(void (^)(NSError *error))failure;
{
    // 1.获得请求管理者
    AFHTTPSessionManager *mgr = [AFHTTPSessionManager manager];
//    mgr.requestSerializer = [AFHTTPRequestSerializer serializer];
//    mgr.responseSerializer = [AFHTTPResponseSerializer serializer];
    // 2.发送GET请求
//    [mgr GET:url parameters:params
//     success:^(AFHTTPRequestOperation *operation, id responseObj) {
//         if (success) {
//             success(responseObj);
//         }
//     } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
//         if (failure) {
//             failure(error);
//         }
//     }];
    [mgr GET:url parameters:params success:^(NSURLSessionDataTask * _Nonnull task, id  _Nonnull responseObject) {
        if (success) {
            success(responseObject);
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        if (failure) {
            failure(error);
        }
    }];
}

+ (void)post:(NSString *)url params:(NSDictionary *)params success:(void (^)(id))success failure:(void (^)(NSError *))failure
{
    // 1.获得请求管理者
    AFHTTPSessionManager *mgr = [AFHTTPSessionManager manager];
//    mgr.requestSerializer = [AFHTTPRequestSerializer serializer];
//    mgr.responseSerializer = [AFHTTPResponseSerializer serializer];
//    // 2.发送POST请求
//    [mgr POST:url parameters:params
//      success:^(AFHTTPRequestOperation *operation, id responseObj) {
//          if (success) {
//              success(responseObj);
//          }
//      } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
//          if (failure) {
//              failure(error);
//          }
//      }];
    [mgr POST:url parameters:params success:^(NSURLSessionDataTask * _Nonnull task, id  _Nonnull responseObject) {
        if (success) {
            success(responseObject);
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        if (failure) {
            failure(error);
        }
    }];
}

+(void)networkReachabilituStatus:(void(^)(MCNetWorkStatus networkStatus))networkStatus{
    AFNetworkReachabilityManager*mgr=[AFNetworkReachabilityManager sharedManager];
    [mgr startMonitoring];
    [mgr setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status) {
        if (networkStatus) {
            networkStatus((NSInteger)status);
        }
    }];
}
+(void)downLoadImage:(NSString *)urlString toImageView:(UIImageView *)imageView{
    NSURL*url=[NSURL URLWithString:urlString];
    [imageView sd_setImageWithURL:url];
}
+(void)downLoadImage:(NSString *)urlString placeholderImgae:(UIImage *)image toImageView:(UIImageView *)imageView{
    NSURL*url=[NSURL URLWithString:urlString];
    [imageView sd_setImageWithURL:url placeholderImage:image];
}
@end
