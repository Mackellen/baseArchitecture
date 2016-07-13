//
//  CacheManager.m
//  baseArchitecture
//
//  Created by Mackellen on 16/7/13.
//  Copyright © 2016年 Mackellen. All rights reserved.
//

#import "CacheManager.h"

@implementation CacheManager

- (NSString *)cacheSizeString {
    
    NSString* cachePath = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES).firstObject;
    NSFileManager* manager = [NSFileManager defaultManager];
    NSArray* files = [manager subpathsAtPath:cachePath];
    unsigned long long size = 0;
    for (NSString* filePath in files) {
        NSString* realPath = [cachePath stringByAppendingPathComponent:filePath];
        if ([manager fileExistsAtPath:realPath]) {
            size += [[manager attributesOfItemAtPath:realPath error:nil] fileSize];
        }
    }
    self.cacheSize = size;
    return [CacheManager sizeStringWithNumber:size];
}

+ (NSString *)sizeStringWithNumber:(unsigned long long)size {
    if (size < 1) {
        return @"暂无缓存";
    }
    NSArray* unit = @[@"KB", @"MB", @"GB"];
    double t = size / 1024;
    NSInteger i = 0;
    while (t > 1024) {
        t = t / 1024;
        i++;
    }
    return [NSString stringWithFormat:@"%.2f%@", t, unit[i]];
}

- (void)clean {
    self.cacheSize = 0;
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_async(queue, ^{
        NSString* cachePath = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES).firstObject;
        NSFileManager* manager = [NSFileManager defaultManager];
        NSArray* files = [manager subpathsAtPath:cachePath];
        //            unsigned long long size = 0;
        for (NSString* filePath in files) {
            NSString* realPath = [cachePath stringByAppendingPathComponent:filePath];
            if ([manager fileExistsAtPath:realPath]) {
                //                    size += [[manager attributesOfItemAtPath:filePath error:nil] fileSize];
                [manager removeItemAtPath:realPath error:nil];
            }
        }
        //清除UIWebView的缓存
        [[NSURLCache sharedURLCache] removeAllCachedResponses];
        //清除cookies
        NSHTTPCookieStorage* cookieStorage = [NSHTTPCookieStorage sharedHTTPCookieStorage];
        for (NSHTTPCookie* cookie in cookieStorage.cookies) {
            [cookieStorage deleteCookie:cookie];
        }
    });
}

- (BOOL)hasCache {
    return _cacheSize > 0;
}

@end
