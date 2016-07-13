//
//  UIButton+Block.h
//  baseMeans
//
//  Created by Mackellen on 16/4/14.
//  Copyright © 2016年 Mackellen. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void (^TouchedBlock)(NSInteger tag);

@interface UIButton (Block)

- (void)handlerClickedButton:(TouchedBlock)touchHandler;

@end
