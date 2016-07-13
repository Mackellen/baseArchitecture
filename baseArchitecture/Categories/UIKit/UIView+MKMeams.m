//
//  UIView+MKMeams.m
//  baseMeans
//
//  Created by Mackellen on 16/2/17.
//  Copyright © 2016年 Mackellen. All rights reserved.
//

#import "UIView+MKMeams.h"

@implementation UIView (MKMeams)

+(instancetype)viewFromNib{
    UINib *nib = [UINib nibWithNibName:NSStringFromClass(self) bundle:nil];
    return [nib instantiateWithOwner:nil options:nil].firstObject;
}

+ (UINib *)loadNib
{
    return [self loadNibNamed:NSStringFromClass([self class])];
}
+ (UINib *)loadNibNamed:(NSString*)nibName
{
    return [self loadNibNamed:nibName bundle:[NSBundle mainBundle]];
}
+ (UINib *)loadNibNamed:(NSString*)nibName bundle:(NSBundle *)bundle
{
    return [UINib nibWithNibName:nibName bundle:bundle];
}
+ (instancetype)loadInstanceFromNib
{
    return [self loadInstanceFromNibWithName:NSStringFromClass([self class])];
}
+ (instancetype)loadInstanceFromNibWithName:(NSString *)nibName
{
    return [self loadInstanceFromNibWithName:nibName owner:nil];
}
+ (instancetype)loadInstanceFromNibWithName:(NSString *)nibName owner:(id)owner
{
    return [self loadInstanceFromNibWithName:nibName owner:owner bundle:[NSBundle mainBundle]];
}
+ (instancetype)loadInstanceFromNibWithName:(NSString *)nibName owner:(id)owner bundle:(NSBundle *)bundle
{
    UIView *result = nil;
    NSArray* elements = [bundle loadNibNamed:nibName owner:owner options:nil];
    for (id object in elements)
    {
        if ([object isKindOfClass:[self class]])
        {
            result = object;
            break;
        }
    }
    return result;
}


- (void)setCornerRadius:(CGFloat)radius{
    self.layer.masksToBounds = YES;
    self.layer.cornerRadius = radius;
}


- (void)setShadow:(CGSize)offset  opacity:(CGFloat)opacity  radius:(CGFloat)radius{
    self.layer.shadowOffset = offset;
    self.layer.shadowRadius = radius;
    self.layer.shadowColor = [UIColor blackColor].CGColor;
    self.layer.shadowOpacity = opacity;
}


- (void)addBorderWithColor:(UIColor *)color width:(CGFloat)widht cornerRadius:(CGFloat)cornerRadius{
    self.layer.borderColor = color.CGColor;
    self.layer.borderWidth = widht;
    self.layer.cornerRadius = cornerRadius;
    if (cornerRadius > 0) {
        self.layer.masksToBounds = YES;
    }
}


- (CGSize)sizeWhileUsingAutolayout{
    CGFloat width = [UIScreen mainScreen].bounds.size.width;
    return [self sizeWhileUsingAutolayoutWidth:width];
}


- (CGSize)sizeWhileUsingAutolayoutWidth:(CGFloat)width{
    [self setNeedsUpdateConstraints];
    [self updateConstraintsIfNeeded];
    self.bounds = CGRectMake(0.0, 0.0, width, CGFLOAT_MAX);
    [self setNeedsLayout];
    [self layoutIfNeeded];
    CGSize autoLayoutSize = [self systemLayoutSizeFittingSize:UILayoutFittingCompressedSize];
    return autoLayoutSize;
}



@end
