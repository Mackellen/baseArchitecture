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

@interface MKAPIManager : NSObject

@property (nonatomic, strong)  AFHTTPSessionManager  *sessionManager;

@end
