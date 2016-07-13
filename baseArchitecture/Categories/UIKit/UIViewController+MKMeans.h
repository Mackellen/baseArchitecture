//
//  UIViewController+MKMeans.h
//  baseMeans
//
//  Created by Mackellen on 16/2/17.
//  Copyright © 2016年 Mackellen. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIViewController (MKMeans)


//根据名称找xib
+(instancetype)viewControllerFromStoryboardName:(NSString *)storyboardName;


//默认初始化xib
+(instancetype)viewControllerFromNib;


//根据对象初始化xib
+(instancetype)viewControllerFromNibWithClass:(Class)objc;




@end
