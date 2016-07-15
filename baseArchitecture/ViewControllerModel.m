//
//  ViewControllerModel.m
//  baseArchitecture
//
//  Created by Mackellen on 16/7/15.
//  Copyright © 2016年 Mackellen. All rights reserved.
//

#import "ViewControllerModel.h"
#import "MKAPIManager+User.h"

@implementation ViewControllerModel

- (RACSignal *)requestData{
    NSMutableDictionary *diction = [NSMutableDictionary  dictionaryWithCapacity:1];
    //    diction[@"max_behot_time"] = [NSString stringWithFormat:@"%d", (int)[[NSDate date] timeIntervalSince1970]];
    diction[@"size"] = @"30";
    return [[[MKAPIManager shareInstance] getNewsList:diction] doNext:^(id x) {
        NSLog(@"do ---- >%@",x);
    }];
}

@end
