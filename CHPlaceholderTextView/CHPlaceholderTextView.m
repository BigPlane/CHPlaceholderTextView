//
//  CHPlaceholderTextView
//  Custom
//
//  Created by CH on 15-1-30.
//  Copyright (c) 2015年 Colin. All rights reserved.
//
#define kPlaceholderDefaultTopMargin 4     // Placeholder上下间距
#define kPlaceholderDefaultLeftMargin 5    // Placeholder左右间距

#import "CHPlaceholderTextView.h"

@implementation CHPlaceholderTextView

#pragma mark - 初始化PlaceholderTextView
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    
    if (self)
    {
        self.opaque = YES;
        
        // 设置通知, 当TextView文字发生改变时, 向自己发送通知
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(textDidChanged) name:UITextViewTextDidChangeNotification object:self];
    }
    
    return self;
}

#pragma mark - 通知事件
- (void)textDidChanged
{
    // 重新绘制
    [self setNeedsDisplay];
}

#pragma mark - 重写属性方法, 实时绘制
- (void)setPlaceholder:(NSString *)placeholder
{
    _placeholder = [placeholder copy];
    
    [self setNeedsDisplay];
}

- (void)setPlaceholderColor:(UIColor *)placeholderColor
{
    _placeholderColor = placeholderColor;
    
    [self setNeedsDisplay];
}

- (void)setText:(NSString *)text
{
    [super setText:text]; // 系统自带属性
    
    [self setNeedsDisplay];
}

- (void)setAttributedText:(NSAttributedString *)attributedText
{
    [super setAttributedText:attributedText];
    
    [self setNeedsDisplay];
}

- (void)setFont:(UIFont *)font
{
    [super setFont:font];
    
    // 会在下一个消息循环调用drawRect
    [self setNeedsDisplay];
}

#pragma mark - 绘制子控件
- (void)drawRect:(CGRect)rect
{
    // 若TextView有文字
    if (self.hasText)
    {
        return;
    }
    
    // 文字属性
    NSMutableDictionary *attrs = [NSMutableDictionary dictionary];
    attrs[NSFontAttributeName] = self.font; // 获取当前PlaceholderTextView的文字属性
    attrs[NSForegroundColorAttributeName] = self.placeholderColor ? self.placeholderColor : [UIColor lightGrayColor];
    
    // 绘制范围
    CGFloat placeholderTopMargin = self.placeholderTopMargin ? self.placeholderTopMargin : kPlaceholderDefaultTopMargin;
    CGFloat placeholderLeftMargin = self.placeholderLeftMargin ? self.placeholderLeftMargin : kPlaceholderDefaultTopMargin;
    
    CGFloat placeholderX = placeholderTopMargin;
    CGFloat placeholderY = placeholderLeftMargin;
    CGFloat placeholderW = rect.size.width - 2 * placeholderLeftMargin;
    CGFloat placeholderH = rect.size.height - 2 * placeholderTopMargin;
    CGRect placeholderRect = CGRectMake(placeholderX, placeholderY, placeholderW, placeholderH);
    
    [self.placeholder drawInRect:placeholderRect withAttributes:attrs];
}

#pragma mark - 移除通知
- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

@end
