为系统自带的TextView添加占位文字
可自定义设置占位文字的内容, 文字颜色, 文字上边距和左边距

/** 占位文字 */
@property (nonatomic, copy) NSString *placeholder;

/** 占位颜色, 默认灰色 */
@property (nonatomic, strong) UIColor *placeholderColor;

/** 占位文字上边距, 默认4.0f */
@property (nonatomic, assign) CGFloat placeholderTopMargin;

/** 占位文字左边边距, 默认5.0f */
@property (nonatomic, assign) CGFloat placeholderLeftMargin;
