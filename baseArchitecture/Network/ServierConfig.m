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
        obj.serviceDiction = [obj servicePathDictionary];
    });
    return obj;
}

- (NSDictionary *)servicePathDictionary{
    NSString *configPath = [[NSBundle mainBundle] pathForResource:@"ServiceAddress" ofType:@"plist"];
    NSArray *array = [NSArray arrayWithContentsOfFile:configPath];
    return  array[_serviceIndex];
}

- (NSString *)getBasePath{
    return _serviceDiction[@"BasePath"];
}

@end
