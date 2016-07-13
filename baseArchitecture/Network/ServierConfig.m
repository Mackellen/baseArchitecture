//
//  ServierConfig.m
//  baseArchitecture
//
//  Created by Mackellen on 16/7/13.
//  Copyright © 2016年 Mackellen. All rights reserved.
//

#import "ServierConfig.h"

@implementation ServierConfig

+ (id)shareInstance{
    static ServierConfig *obj = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        obj = [[ServierConfig alloc] init];
    });
    return obj;
}

- (NSURL *)getBasePath{
    
    return [NSURL URLWithString:@""];
}

@end
