//
//  ServierConfig.h
//  baseArchitecture
//
//  Created by Mackellen on 16/7/13.
//  Copyright © 2016年 Mackellen. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ServierConfig : NSObject

+ (id)shareInstance;

- (NSURL *)getBasePath;

@end
