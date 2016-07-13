//
//  UIViewController+MKMeans.m
//  baseMeans
//
//  Created by Mackellen on 16/2/17.
//  Copyright © 2016年 Mackellen. All rights reserved.
//

#import "UIViewController+MKMeans.h"

@implementation UIViewController (MKMeans)

//根据名称找xib
+(instancetype)viewControllerFromStoryboardName:(NSString *)storyboardName{
    UIStoryboard *board = [UIStoryboard storyboardWithName:storyboardName bundle:nil];
    return [board instantiateViewControllerWithIdentifier:NSStringFromClass(self)];
}

//默认初始化xib
+(instancetype)viewControllerFromNib{
    UINib *nib = [UINib nibWithNibName:NSStringFromClass(self) bundle:nil];
    return [nib instantiateWithOwner:nil options:nil].firstObject;
}

//根据对象初始化xib
+(instancetype)viewControllerFromNibWithClass:(Class)objc{
    UINib *nib = [UINib nibWithNibName:NSStringFromClass(objc) bundle:nil];
    return  [nib instantiateWithOwner:nil options:nil].firstObject;
}



@end
