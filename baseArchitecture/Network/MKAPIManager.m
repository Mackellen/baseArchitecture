//
//  MKAPIManager.m
//  baseArchitecture
//
//  Created by Mackellen on 16/7/13.
//  Copyright © 2016年 Mackellen. All rights reserved.
//

#import "MKAPIManager.h"
#import "ServierConfig.h"

@implementation MKAPIManager

- (instancetype)init
{
    self = [super init];
    if (self) {
        
        NSURL *baseURL = [[ServierConfig shareInstance] getBasePath];
        NSURLSessionConfiguration *config = [NSURLSessionConfiguration defaultSessionConfiguration];
        _sessionManager = [[AFHTTPSessionManager alloc] initWithBaseURL:baseURL sessionConfiguration:config];
        _sessionManager.responseSerializer = [AFJSONResponseSerializer serializer];
        _sessionManager.requestSerializer.timeoutInterval = 15;
        
    }
    return self;
}




@end
