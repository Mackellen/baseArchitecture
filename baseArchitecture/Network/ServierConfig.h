//
//  ServierConfig.h
//  baseArchitecture
//
//  Created by Mackellen on 16/7/13.
//  Copyright © 2016年 Mackellen. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ServierConfig : NSObject


@property (nonatomic) NSInteger  serviceIndex;
@property (nonatomic, strong) NSDictionary *serviceDiction;

+ (id)shareInstance;

- (NSString *)getBasePath;

@end
