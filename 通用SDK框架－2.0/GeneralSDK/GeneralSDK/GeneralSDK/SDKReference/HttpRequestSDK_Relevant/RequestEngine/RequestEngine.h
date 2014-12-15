//
//  RequestEngine.h
//  GeneralFrame
//
//  Created by user on 14-4-16.
//  Copyright (c) 2014年 ios. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AFNetworking.h"
#import "CommonHead.h"
#pragma mark - 网络请求处理引擎

@interface RequestEngine :AFHTTPRequestOperationManager
//单例
+(RequestEngine *)Instance;

//创建HTTP头
-(void)setDefaultHeader:(NSString *)field value:(NSString *)value;



//进行相关请求
-(void)requestWithURL:(NSString *)url
           parameters:(NSDictionary *)parameters
         successBlock:(void(^)(id data))successBlock
            failBlock:(void(^)(void))failBlock;

//创建单个请求
-(id)createRequest:(NSString *)urlStr
        parameters:(NSDictionary *)parameters
      successBlock:(void (^)(NSString * taskURL, id responseObject))successBlock
         failBlock:(void (^)(NSString * taskURL, NSError *error))failBlock;


//创建单个下载请求
-(id)createDownLoadRequest:(NSString *)urlStr
              successBlock:(void (^)(NSString * taskURL, id responseObject))successBlock
                 failBlock:(void (^)(NSString * taskURL, NSError *error))failBlock
              downLoadPath:(NSString *)path
             downLoadBlock:(void (^)(NSUInteger bytesRead, long long totalBytesRead, long long totalBytesExpectedToRead))downLoadBlock
           expireTimeBlock:(void (^)(void))expireTimeBlock;


//进行队列请求
-(void)requestWithQueue:(NSArray *)operations
              queueType:(QueueType)queueType
   queueCompletionBlock:(void(^)(NSArray *operations))queueCompletionBlock;

//暂停整个下载请求队列
-(void)pauseAllOperations;
//恢复整个下载请求队列
-(void)resumeAllOperations;
//取消整个下载请求队列
-(void)concelAllOperations;

@end
