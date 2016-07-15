//
//  MKAPIManager+User.m
//  baseArchitecture
//
//  Created by Mackellen on 16/7/14.
//  Copyright © 2016年 Mackellen. All rights reserved.
//

#import "MKAPIManager+User.h"

@implementation MKAPIManager (User)


#pragma mark - 用户登录
- (RACSignal *)loginWithAccount:(NSString *)account  password:(NSString *)pass{
    NSDictionary *parameters = @{@"account":account,@"password":pass};
    return  [[self startDownloadDataWithPath:@"" parameters:parameters type:MKRequestTypePost] map:^id(NSDictionary *value) {
        return [value valueForKey:@"content"];
    }];
}

#pragma mark -测试列表
- (RACSignal *)getNewsList:(NSDictionary *)diction{
    NSMutableDictionary *parameters = [NSMutableDictionary dictionaryWithCapacity:1];
    [parameters addEntriesFromDictionary:diction];
    return [[self startDownloadDataWithPath:@"news/list.do" parameters:parameters type:MKRequestTypePost] map:^RACStream *(NSDictionary *value) {
        return  [value valueForKey:@"detail"];
    }];
    
}

@end
