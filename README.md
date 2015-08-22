为系统自带的TextView添加占位文字
可自定义设置占位文字的内容, 文字颜色, 文字上边距和左边距


@property (nonatomic, copy) NSString *placeholder;

@property (nonatomic, strong) UIColor *placeholderColor;

@property (nonatomic, assign) CGFloat placeholderTopMargin;

@property (nonatomic, assign) CGFloat placeholderLeftMargin;
