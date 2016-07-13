//
//  CacheManager.h
//  baseArchitecture
//
//  Created by Mackellen on 16/7/13.
//  Copyright © 2016年 Mackellen. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CacheManager : NSObject

@property (nonatomic, assign) unsigned long long cacheSize;

- (void)clean;
- (NSString *)cacheSizeString;
- (BOOL)hasCache;


@end
