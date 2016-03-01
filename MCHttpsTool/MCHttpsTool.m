//
//  MCHttpsTool.m
//  MCHttpsTool
//
//  Created by ZMC on 16/3/1.
//  Copyright © 2016年 Zmc. All rights reserved.
//

#import "MCHttpsTool.h"

@implementation MCHttpsTool
+ (void)getRequest:(NSString *)url params:(NSDictionary *)params success:(void (^)(id responseObject))success failure:(void (^)(NSError *error))failure timeoutInt:(NSTimeInterval)timeoutInt{
    AFHTTPRequestOperationManager *mgr = [AFHTTPRequestOperationManager manager];
    mgr.responseSerializer.acceptableContentTypes=[NSSet setWithObjects:@"application/json",@"text/json", @"text/plain", @"text/html", nil];
    [mgr.requestSerializer willChangeValueForKey:@"timeoutInterval"];
    [mgr.requestSerializer didChangeValueForKey:@"timeoutInterval"];
    mgr.requestSerializer = [AFJSONRequestSerializer serializer];
    mgr.responseSerializer = [AFJSONResponseSerializer serializer];
    mgr.requestSerializer.timeoutInterval=timeoutInt;
    [mgr GET:url parameters:params success:^(AFHTTPRequestOperation *operation, id responseObject) {
        if (success) {
            success(responseObject);
        }
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        if (failure) {
            failure(error);
        }
    }];
}

+ (void)postRequest:(NSString *)url params:(NSDictionary *)params success:(void (^)(id responseObject))success failure:(void (^)(NSError *error))failure timeoutInt:(NSTimeInterval)timeoutInt{
    AFHTTPRequestOperationManager *mgr = [AFHTTPRequestOperationManager manager];
    mgr.responseSerializer.acceptableContentTypes=[NSSet setWithObjects:@"application/json",@"text/json", @"text/plain", @"text/html", nil];
    [mgr.requestSerializer willChangeValueForKey:@"timeoutInterval"];
    [mgr.requestSerializer didChangeValueForKey:@"timeoutInterval"];
    mgr.requestSerializer = [AFJSONRequestSerializer serializer];
    mgr.responseSerializer = [AFJSONResponseSerializer serializer];
    mgr.requestSerializer.timeoutInterval=timeoutInt;
    [mgr.requestSerializer didChangeValueForKey:@"timeoutInterval"];
    [mgr POST:url parameters:params success:^(AFHTTPRequestOperation *operation, id responseObject) {
        if (success) {
            success(responseObject);
        }
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        if (failure) {
            failure(error);
        }
    }];
    
}

+(void)networkReachabilituStatus:(void(^)(MCNetWorkStatus networkStatus))networkStatus{
    AFNetworkReachabilityManager*mgr=[AFNetworkReachabilityManager sharedManager];
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
