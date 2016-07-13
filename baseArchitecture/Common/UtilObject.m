//
//  UtilObject.m
//  baseArchitecture
//
//  Created by Mackellen on 16/7/13.
//  Copyright © 2016年 Mackellen. All rights reserved.
//

#import "UtilObject.h"

@implementation UtilObject

//获取系统UUID
+ (NSString *)deviceId {
    static NSString* deviceId = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        deviceId = [UIDevice currentDevice].identifierForVendor.UUIDString;
    });
    return deviceId;
}

//获取系统版本
+ (NSString *)systemVersion {
    static NSString* version = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        version = [UIDevice currentDevice].systemVersion;
    });
    return version;
}

// 获取App 版本号
+ (NSString *)applicationVersion {
    static NSString* version = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        NSDictionary* dict = [NSBundle mainBundle].infoDictionary;
        version = dict[@"CFBundleShortVersionString"];
    });
    return version;
}


// 替换空格或隔段
+ (NSString *)getReplaceAfterString:(NSString *)str{
    NSString *afterStr = str;
    afterStr = [afterStr stringByReplacingOccurrencesOfString:@"\r'\r" withString:@"\r"];
    afterStr = [afterStr stringByReplacingOccurrencesOfString:@"\n" withString:@""];
    afterStr = [afterStr stringByReplacingOccurrencesOfString:@"&ldquo;" withString:@"“"];
    afterStr = [afterStr stringByReplacingOccurrencesOfString:@"&rdquo;" withString:@"”"];
    afterStr = [afterStr stringByReplacingOccurrencesOfString:@"&middot;" withString:@"·"];
    afterStr = [afterStr stringByReplacingOccurrencesOfString:@"&nbsp;" withString:@" "];
    afterStr = [afterStr stringByReplacingOccurrencesOfString:@"&lt;" withString:@"<"];
    afterStr = [afterStr stringByReplacingOccurrencesOfString:@"&gt;" withString:@">"];
    afterStr = [afterStr stringByReplacingOccurrencesOfString:@"&quot;" withString:@"\""];
    afterStr = [afterStr stringByReplacingOccurrencesOfString:@"&qpos;" withString:@"'"];
    afterStr = [afterStr stringByReplacingOccurrencesOfString:@"&mdash;" withString:@"—"];
    afterStr = [afterStr stringByReplacingOccurrencesOfString:@"&hellip;" withString:@"…"];
    return afterStr;
}


// 密码校验6-20位数字和字母组合
+ (BOOL)checkPass:(NSString *)passStr{
    NSString *pattern = @"(?=.*[a-zA-Z])(?=.*[0-9])[a-zA-Z0-9]{6,20}";
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", pattern];
    BOOL isMatch = [pred evaluateWithObject:passStr];
    return isMatch;
}

// 用户名校验6-16位数字、字母组合
+ (BOOL)checkUserName:(NSString *)userStr
{
    NSString *pattern = @"[a-zA-Z0-9-_]{6,16}";
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", pattern];
    BOOL isMatch = [pred evaluateWithObject:userStr];
    return isMatch;
}

//手机号码校验
+ (BOOL)isPhoneNumber:(NSString *)mobile
{
    NSString * regex = @"^0?(13[0-9]|15[012356789]|17[678]|18[0-9]|14[57])[0-9]{8}$";
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
    BOOL isMatch = [pred evaluateWithObject:mobile];
    
    return isMatch;
}


// 邮箱校验
+ (BOOL) isEmail:(NSString*) checkString {
    if([checkString length]==0){
        return NO;
    }
    NSString *regExPattern = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
    
    NSRegularExpression *regEx = [[NSRegularExpression alloc] initWithPattern:regExPattern options:NSRegularExpressionCaseInsensitive error:nil];
    NSUInteger regExMatches = [regEx numberOfMatchesInString:checkString options:0 range:NSMakeRange(0, [checkString length])];
    
    if (regExMatches == 0) {
        return NO;
    } else {
        return YES;
    }
}

// 身份证校验
+ (BOOL)isUserIdentityCard: (NSString *)idCard
{
    NSString *pattern = @"(^[0-9]{15}$)|([0-9]{17}([0-9]|X|x)$)";
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", pattern];
    BOOL isMatch = [pred evaluateWithObject:idCard];
    return isMatch;
}

//  键盘收起
+ (void)resignKeyBoardInView:(UIView *)view
{
    for (UIView *v in view.subviews) {
        if ([v.subviews count] > 0) {
            [self resignKeyBoardInView:v];
        }
        if ([v isKindOfClass:[UITextView class]] || [v isKindOfClass:[UITextField class]]) {
            [v resignFirstResponder];
        }
    }
}


//两端不同的字体颜色字符相拼接
+ (NSAttributedString *)attributedStringWithPrefix:(NSString *)prefixStr prefixColor:(UIColor *)prefixColor   suffixStr:(NSString *)suffixStr suffixColor:(UIColor *)suffixColor{
    NSMutableAttributedString *start = [[NSMutableAttributedString alloc] initWithString:prefixStr];
    [start addAttribute:NSForegroundColorAttributeName value:prefixColor range:NSMakeRange(0, prefixStr.length)];
    
    NSMutableAttributedString *last = [[NSMutableAttributedString alloc] initWithString:suffixStr];
    [last addAttribute:NSForegroundColorAttributeName value:suffixColor range:NSMakeRange(0, suffixStr.length)];
    [start appendAttributedString:last];
    
    return start;
}


//两端不同的字体大小字符相拼接
+ (NSAttributedString *)attributedStringWithPrefix:(NSString *)prefixStr prefixSize:(CGFloat)prefixSize  suffixStr:(NSString *)suffixStr suffixSize:(CGFloat)suffixSize{
    NSMutableAttributedString *start = [[NSMutableAttributedString alloc] initWithString:prefixStr];
    [start addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:prefixSize] range:NSMakeRange(0, prefixStr.length)];
    
    NSMutableAttributedString *last = [[NSMutableAttributedString alloc] initWithString:suffixStr];
    [last addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:suffixSize] range:NSMakeRange(0, suffixStr.length)];
    [start appendAttributedString:last];
    
    return start;
}

// 设置字符串的大小和颜色
+ (NSMutableAttributedString *)attributedStringWithString:(NSString *)value fontSize:(CGFloat)fontSize textColor:(UIColor *)color{
    if (value.length < 1) {
        value = @"";
    }
    NSMutableAttributedString* text = [[NSMutableAttributedString alloc] initWithString:value];
    [text addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:fontSize] range:NSMakeRange(0, value.length)];
    [text addAttribute:NSForegroundColorAttributeName value:color range:NSMakeRange(0, value.length)];
    
    return text;
}


@end
