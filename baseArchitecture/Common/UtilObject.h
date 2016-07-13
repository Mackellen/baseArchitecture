//
//  UtilObject.h
//  baseArchitecture
//
//  Created by Mackellen on 16/7/13.
//  Copyright © 2016年 Mackellen. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface UtilObject : NSObject

// 获取系统UUID
+ (NSString *)deviceId;

//获取系统版本
+ (NSString *)systemVersion;

// 获取App 版本号
+ (NSString *)applicationVersion;


// 替换空格或隔段
+ (NSString *)getReplaceAfterString:(NSString *)str;

// 密码校验6-20位数字和字母组合
+ (BOOL)checkPass:(NSString *)passStr;

// 用户名校验6-16位数字、字母组合
+ (BOOL)checkUserName:(NSString *)userStr;


//手机号码校验
+ (BOOL)isPhoneNumber:(NSString *)mobile;

// 邮箱校验
+ (BOOL) isEmail:(NSString*) checkString;

// 身份证校验
+ (BOOL)isUserIdentityCard: (NSString *)idCard;

// 键盘收起
+ (void)resignKeyBoardInView:(UIView *)view;

// 两端不同的字体颜色字符相拼接
+ (NSAttributedString *)attributedStringWithPrefix:(NSString *)prefixStr prefixColor:(UIColor *)prefixColor   suffixStr:(NSString *)suffixStr suffixColor:(UIColor *)suffixColor;

//两端不同的字体大小字符相拼接
+ (NSAttributedString *)attributedStringWithPrefix:(NSString *)prefixStr prefixSize:(CGFloat)prefixSize  suffixStr:(NSString *)suffixStr suffixSize:(CGFloat)suffixSize;

// 设置字符串的大小和颜色
+ (NSMutableAttributedString *)attributedStringWithString:(NSString *)value fontSize:(CGFloat)fontSize textColor:(UIColor *)color;


@end
