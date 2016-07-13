//
//  UIButton+Block.m
//  baseMeans
//
//  Created by Mackellen on 16/4/14.
//  Copyright © 2016年 Mackellen. All rights reserved.
//

#import "UIButton+Block.h"
#import <objc/runtime.h>

static const void *UIButtonClickedBlockKey = &UIButtonClickedBlockKey;

@implementation UIButton (Block)

- (void)handlerClickedButton:(TouchedBlock)touchHandler{
    objc_setAssociatedObject(self, UIButtonClickedBlockKey, touchHandler, OBJC_ASSOCIATION_COPY_NONATOMIC);
    [self addTarget:self action:@selector(actionTouched:) forControlEvents:UIControlEventTouchUpInside];
}

- (void)actionTouched:(UIButton *)btn{
    TouchedBlock block = objc_getAssociatedObject(self, UIButtonClickedBlockKey);
    if (block) {
        block(btn.tag);
    }
}

@end
