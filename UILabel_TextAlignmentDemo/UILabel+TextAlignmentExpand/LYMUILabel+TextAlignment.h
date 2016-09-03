//
//  LYMUILabel+TextAlignment.h
//  UILabel_TextAlignmentDemo
//
//  Created by Charming04 on 16/9/3.
//  Copyright © 2016年 Charming04. All rights reserved.
//

#import <UIKit/UIKit.h>

/* Values for NSTextAlignmentExpand */
typedef NS_ENUM(NSInteger, NSTextAlignmentExpand) {
    NSTextAlignmentTop           = 5,     // Visually top aligned
    NSTextAlignmentBottom        = 6,     // Visually bottom aligned
    NSTextAlignmentLeftTop       = 7,     // Visually left and top aligned
    NSTextAlignmentRightTop      = 8,     // Visually right and top aligned
    NSTextAlignmentLeftBottom    = 9,     // Visually left and bottom aligned
    NSTextAlignmentRightBottom   = 10,    // Visually right and bottom aligned
} NS_ENUM_AVAILABLE_IOS(6_0);

@interface UILabel (LMTextAlignmentAdditions)

@end
