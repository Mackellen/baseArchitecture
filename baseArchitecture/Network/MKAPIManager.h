//
//  MKAPIManager.h
//  baseArchitecture
//
//  Created by Mackellen on 16/7/13.
//  Copyright © 2016年 Mackellen. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AFNetworking/AFNetworking.h>
#import <ReactiveCocoa/ReactiveCocoa.h>


typedef void (^ServerReturnObject)(NSProgress *uploadProgress, NSDictionary *responseObject,NSError *error);

typedef enum {
    MKRequestTypeGet = 0,
    MKRequestTypePost = 1,
    MKRequestTypePostPatch
} MKRequestType;

@interface MKAPIManager : NSObject

@property (nonatomic, strong)  AFHTTPSessionManager  *sessionManager;
@property (assign, nonatomic) MKRequestType type;


+ (id)shareInstance;

- (RACSignal *)startDownloadDataWithPath:(NSString *)path parameters:(NSDictionary *)parameters type:(MKRequestType)type;

@end
