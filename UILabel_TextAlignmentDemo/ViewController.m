//
//  ViewController.m
//  UILabel_TextAlignmentDemo
//
//  Created by Charming04 on 16/9/3.
//  Copyright © 2016年 Charming04. All rights reserved.
//

#import "ViewController.h"
#import "LYMUILabel+TextAlignment.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    NSArray *textArr = @[
                         @"左上",
                         @"右上",
                         @"正上",
                         @"正下",
                         @"左下",
                         @"右下"
                         ];
    NSArray *alinmentArr = @[
                             @(NSTextAlignmentLeftTop),
                             @(NSTextAlignmentRightTop),
                             @(NSTextAlignmentTop),
                             @(NSTextAlignmentBottom),
                             @(NSTextAlignmentLeftBottom),
                             @(NSTextAlignmentRightBottom)
                             ];
    
    int row = 3;
    int col = (int)textArr.count / row;
    
    CGFloat marginX = 10;
    CGFloat marginY = 10;
    
    CGFloat labelWidth =  (self.view.frame.size.width - marginX * (col + 1))/col;
    CGFloat labelHeight = (self.view.frame.size.height - 20 - marginY * (row + 1))/row;
    
    for (int i = 0; i < textArr.count; i++) {
        
        int realRow = i/col + 1;
        int realCol = i%col + 1;
        
        UILabel *label = [[UILabel alloc] initWithFrame:
                          CGRectMake(realCol * marginX + (realCol - 1) * labelWidth,
                                     20 + realRow * marginY + (realRow - 1) * labelHeight,
                                     labelWidth,
                                     labelHeight)];
        label.text = textArr[i];
        label.textAlignment = [alinmentArr[i] integerValue];
        label.backgroundColor = [UIColor orangeColor];
        [self.view addSubview:label];
    }
    
}
@end
