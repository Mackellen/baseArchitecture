//
//  MKTextField.m
//  baseArchitecture
//
//  Created by Mackellen on 16/7/13.
//  Copyright © 2016年 Mackellen. All rights reserved.
//

#import "MKTextField.h"

@implementation MKTextField


- (CGRect)clearButtonRectForBounds:(CGRect)bounds
{
    return CGRectMake(bounds.origin.x + bounds.size.width -20, bounds.origin.y + bounds.size.height -25, 20, 20);
}

//控制placeHolder的位置，左右缩20
- (CGRect)placeholderRectForBounds:(CGRect)bounds
{
    CGRect inset = CGRectMake(bounds.origin.x+10, bounds.origin.y, bounds.size.width -10, bounds.size.height);//更好理解些
    return inset;
}

//控制显示文本的位置
- (CGRect)textRectForBounds:(CGRect)bounds
{
    CGRect inset = CGRectMake(bounds.origin.x+10, bounds.origin.y, bounds.size.width-10, bounds.size.height);//更好理解些
    return inset;
}

//控制编辑文本的位置
- (CGRect)editingRectForBounds:(CGRect)bounds
{
    //return CGRectInset( bounds, 10 , 0 );
    
    CGRect inset = CGRectMake(bounds.origin.x +10, bounds.origin.y, bounds.size.width -30, bounds.size.height);
    return inset;
}

//控制左视图位置
- (CGRect)leftViewRectForBounds:(CGRect)bounds
{
    CGRect inset = CGRectMake(bounds.origin.x +10, bounds.origin.y, bounds.size.width-250, bounds.size.height);
    return inset;
}

//控制placeHolder的颜色、字体
//- (void)drawPlaceholderInRect:(CGRect)rect
//{
//    [[UIColor orangeColor] setFill];
//    [[self placeholder] drawInRect:rect withFont:[UIFont systemFontOfSize:20]];
//}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
