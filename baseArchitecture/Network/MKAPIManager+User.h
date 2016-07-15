//
//  MKAPIManager+User.h
//  baseArchitecture
//
//  Created by Mackellen on 16/7/14.
//  Copyright © 2016年 Mackellen. All rights reserved.
//

#import "MKAPIManager.h"

@interface MKAPIManager (User)


- (RACSignal *)loginWithAccount:(NSString *)account  password:(NSString *)pass;

- (RACSignal *)getNewsList:(NSDictionary *)diction;

@end
