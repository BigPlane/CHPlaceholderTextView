//
//  CHPlaceholderTextView.h
//  Custom
//
//  Created by CH on 15-1-30.
//  Copyright (c) 2015年 Colin. All rights reserved.
//  带有占位文字的TextView

#import <UIKit/UIKit.h>

@interface CHPlaceholderTextView : UITextView

/** 占位文字 */
@property (nonatomic, copy) NSString *placeholder;

/** 占位颜色, 默认灰色 */
@property (nonatomic, strong) UIColor *placeholderColor;

/** 占位文字上边距, 默认4.0f */
@property (nonatomic, assign) CGFloat placeholderTopMargin;

/** 占位文字左边边距, 默认5.0f */
@property (nonatomic, assign) CGFloat placeholderLeftMargin;

@end
