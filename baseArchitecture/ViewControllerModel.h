//
//  ViewControllerModel.h
//  baseArchitecture
//
//  Created by Mackellen on 16/7/15.
//  Copyright © 2016年 Mackellen. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <ReactiveCocoa/ReactiveCocoa.h>

@interface ViewControllerModel : NSObject

- (RACSignal *)requestData;

@end
