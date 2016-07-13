//
//  UIView+MKMeams.h
//  baseMeans
//
//  Created by Mackellen on 16/2/17.
//  Copyright © 2016年 Mackellen. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (MKMeams)

//初始化xib
+(instancetype)viewFromNib;
+ (UINib *)loadNib;
+ (UINib *)loadNibNamed:(NSString*)nibName;
+ (UINib *)loadNibNamed:(NSString*)nibName bundle:(NSBundle *)bundle;
+ (instancetype)loadInstanceFromNib;
+ (instancetype)loadInstanceFromNibWithName:(NSString *)nibName;
+ (instancetype)loadInstanceFromNibWithName:(NSString *)nibName owner:(id)owner;
+ (instancetype)loadInstanceFromNibWithName:(NSString *)nibName owner:(id)owner bundle:(NSBundle *)bundle;


//设置圆角
- (void)setCornerRadius:(CGFloat)radius;

//设置边框阴影
- (void)setShadow:(CGSize)offset  opacity:(CGFloat)opacity  radius:(CGFloat)radius;

//添加边框
- (void)addBorderWithColor:(UIColor *)color width:(CGFloat)widht cornerRadius:(CGFloat)cornerRadius;

//根据宽度获取高度
- (CGSize)sizeWhileUsingAutolayout;

@end
