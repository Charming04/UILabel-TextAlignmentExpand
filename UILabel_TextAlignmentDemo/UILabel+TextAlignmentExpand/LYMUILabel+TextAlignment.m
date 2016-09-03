//
//  LYMUILabel+TextAlignment.m
//  UILabel_TextAlignmentDemo
//
//  Created by Charming04 on 16/9/3.
//  Copyright © 2016年 Charming04. All rights reserved.
//

#import "LYMUILabel+TextAlignment.h"
#import <objc/runtime.h>

@implementation UILabel (LMTextAlignmentAdditions)

+(void)load {
    
    /** 获取原始的 textRectForBounds:limitedToNumberOfLines:方法*/
    
    Method originalTextRectForBounds = class_getInstanceMethod([self class], @selector(textRectForBounds:limitedToNumberOfLines:));
    Method exchageTextRectForBounds = class_getInstanceMethod([self class], @selector(lm_textRectForBounds:limitedToNumberOfLines:));
    method_exchangeImplementations(originalTextRectForBounds, exchageTextRectForBounds);
    
    /** 获取原始的 drawTextInRect:方法*/
    
    Method originalDrawTextInRect = class_getInstanceMethod([self class], @selector(drawTextInRect:));
    Method exchageDrawTextInRect = class_getInstanceMethod([self class], @selector(lm_drawTextInRect:));
    method_exchangeImplementations(originalDrawTextInRect, exchageDrawTextInRect);
    
}

- (CGRect)lm_textRectForBounds:(CGRect)bounds limitedToNumberOfLines:(NSInteger)numberOfLines {
    
    /** 先调用系统的textRect...方法*/
    CGRect textRect = [self lm_textRectForBounds:bounds limitedToNumberOfLines:numberOfLines];
    
    switch ((NSTextAlignmentExpand)self.textAlignment) {
        case NSTextAlignmentTop:
            textRect.origin.y = bounds.origin.y;
            textRect.origin.x = 0.5 *(bounds.size.width - textRect.size.width);
            break;
        case NSTextAlignmentLeftTop:
            textRect.origin.y = bounds.origin.y;
            break;
        case NSTextAlignmentRightTop:
            textRect.origin.y = bounds.origin.y;
            textRect.origin.x = bounds.size.width - textRect.size.width;
            break;
        case NSTextAlignmentBottom:
            textRect.origin.y = bounds.origin.y + bounds.size.height - textRect.size.height;
            textRect.origin.x = 0.5 *(bounds.size.width - textRect.size.width);
            break;
        case NSTextAlignmentLeftBottom:
            textRect.origin.y = bounds.origin.y + bounds.size.height - textRect.size.height;
            break;
        case NSTextAlignmentRightBottom:
            textRect.origin.y = bounds.origin.y + bounds.size.height - textRect.size.height;
            textRect.origin.x = bounds.size.width - textRect.size.width;
            break;
        default:
            textRect.origin.y = bounds.origin.y + (bounds.size.height - textRect.size.height) / 2.0;
    }
    return textRect;
}

-(void)lm_drawTextInRect:(CGRect)requestedRect {
    
    /** 相当于调用lm_textRect...方法*/
    CGRect actualRect = [self textRectForBounds:requestedRect limitedToNumberOfLines:self.numberOfLines];
    
    /** 后调用系统的drawTextInRect:方法*/
    [self lm_drawTextInRect:actualRect];
}

@end
