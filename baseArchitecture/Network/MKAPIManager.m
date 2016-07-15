//
//  MKAPIManager.m
//  baseArchitecture
//
//  Created by Mackellen on 16/7/13.
//  Copyright © 2016年 Mackellen. All rights reserved.
//

#import "MKAPIManager.h"
#import "ServierConfig.h"
#import <SBJson/SBJson4.h>

@implementation MKAPIManager


+ (id)shareInstance{
    static MKAPIManager *_manager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _manager = [[MKAPIManager alloc] init];
    });
    return _manager;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        
        NSURL *baseURL = [NSURL URLWithString:[[ServierConfig shareInstance] getBasePath]];
        NSURLSessionConfiguration *config = [NSURLSessionConfiguration defaultSessionConfiguration];
        _sessionManager = [[AFHTTPSessionManager alloc] initWithBaseURL:baseURL sessionConfiguration:config];
        _sessionManager.responseSerializer = [AFHTTPResponseSerializer serializer];
        _sessionManager.requestSerializer.timeoutInterval = 15;
    }
    return self;
}


#pragma mark -公共参数
- (NSMutableDictionary *)publicParameters{
    NSMutableDictionary *diction = [NSMutableDictionary dictionaryWithCapacity:1];
    diction[@"platform"] = @"IOS";
    diction[@"deviceId"] = @"18e311b9669bad5dfcba69eaaacb143959f16666";
    diction[@"version"] = @"1.0";
    diction[@"osVersion"] = @"9.0.2";
    return diction;
}

#pragma mark -开始下载数据
- (RACSignal *)startDownloadDataWithPath:(NSString *)path parameters:(NSDictionary *)parameters type:(MKRequestType)type{
    NSMutableDictionary *dictions = [NSMutableDictionary dictionaryWithDictionary:parameters];
//    [dictions addEntriesFromDictionary:[self publicParameters]];
    switch (type) {
        case MKRequestTypeGet:
            return [self interfaceGetWithPath:path parameters:dictions];
            break;
        case MKRequestTypePost:
            return [self interfacePostWithPath:path parameters:dictions];
            break;
        case MKRequestTypePostPatch:
            return [self interfacePatchWithPath:path parameters:dictions];
            break;
    }
}


#pragma mark - Post方式获取数据
- (RACSignal *)interfacePostWithPath:(NSString *)path parameters:(NSDictionary *)parameters{
    return [[RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
        NSURLSessionDataTask *task = [_sessionManager POST:path parameters:parameters progress:^(NSProgress * _Nonnull uploadProgress) {
//            [subscriber sendNext:uploadProgress];
        } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
            NSDictionary *diction = [NSJSONSerialization JSONObjectWithData:responseObject options:0 error:nil];
            if ([diction isKindOfClass:[NSDictionary class]]) {
                [subscriber sendNext:diction];
            }else{
                [subscriber sendNext:@{}];
            }
            [subscriber sendCompleted];
            
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            [subscriber sendNext:error];
        }];
        return [RACDisposable disposableWithBlock:^{
            [task cancel];
        }];
    }] setNameWithFormat:@"%@_API_For_Post: %@, parameters: %@", self.class, path, parameters];
    
}

#pragma mark - Get方式获取数据
- (RACSignal *)interfaceGetWithPath:(NSString *)path  parameters:(NSDictionary *)parameters{
    return  [[RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
        
        NSURLSessionDataTask *task = [_sessionManager GET:path parameters:parameters progress:^(NSProgress * _Nonnull downloadProgress) {
            [subscriber sendNext:downloadProgress];
        } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
            NSDictionary *diction = [NSJSONSerialization JSONObjectWithData:responseObject options:0 error:nil];
            if ([diction isKindOfClass:[NSDictionary class]]) {
                [subscriber sendNext:diction];
            }else{
                [subscriber sendNext:@{}];
            }
            [subscriber sendCompleted];
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            [subscriber sendNext:error];
        }];
        
        return [RACDisposable disposableWithBlock:^{
            [task cancel];
        }];
    }] setNameWithFormat:@"%@_API_For_Get: %@, parameters: %@", self.class, path, parameters];
}

#pragma mark - Patch方式获取数据
- (RACSignal *)interfacePatchWithPath:(NSString *)path  parameters:(NSDictionary *)parameters{
    return  [[RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
        NSURLSessionDataTask *task = [_sessionManager PATCH:path parameters:parameters success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
            NSDictionary *diction = [NSJSONSerialization JSONObjectWithData:responseObject options:0 error:nil];
            if ([diction isKindOfClass:[NSDictionary class]]) {
                [subscriber sendNext:diction];
            }else{
                [subscriber sendNext:@{}];
            }
            [subscriber sendCompleted];
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            [subscriber sendNext:error];
        }];
        
        return [RACDisposable disposableWithBlock:^{
            [task cancel];
        }];
    }] setNameWithFormat:@"%@_API_For_Patch: %@, parameters: %@", self.class, path, parameters];
}





@end
