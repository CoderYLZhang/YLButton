//
//  YLButton.m
//  
//
//  Created by 张银龙 on 14/12/8.
//  Copyright © 2014年 张银龙. All rights reserved.
//

#import "YLButton.h"
#import <objc/runtime.h>

@implementation YLButton

#pragma mark - 初始化

- (void)awakeFromNib{
    [super awakeFromNib];
    [self setUp];
}

- (instancetype)initWithFrame:(CGRect)frame {

    if (self = [super initWithFrame:frame]) {

        [self setUp];
    }
    return self;
}

- (void)setUp {

    self.titleLabel.textAlignment = NSTextAlignmentCenter;
    self.titleLabel.adjustsFontSizeToFitWidth = YES;
    _imageAlignment = YLImageAlignmentLeft;
    _clickDurationTime = 0;
    _yl_imageInsets = UIEdgeInsetsZero;
    _yl_titleInsets = UIEdgeInsetsZero;
}

#pragma mark - 布局

- (void)layoutSubviews{
    [super layoutSubviews];

    switch (_imageAlignment) {
        default:
        case YLImageAlignmentLeft:
            break;
        case YLImageAlignmentRight:
            [self imageAlignmentLayoutRight];
            break;
        case YLImageAlignmentTop:
            [self imageAlignmentLayoutTop];
            break;
        case YLImageAlignmentBottom:
            [self imageAlignmentLayoutBottom];
            break;
    }
}

#pragma mark LayoutRight

- (void)imageAlignmentLayoutRight {

    CGRect imageFrame = self.imageView.frame;
    CGRect titleFrame = self.titleLabel.frame;

    NSInteger space = 0.5 * (self.frame.size.width - imageFrame.size.width - titleFrame.size.width);
    CGFloat imageX = self.frame.size.width - imageFrame.size.width - space;
    CGFloat imageY = imageFrame.origin.y;
    CGFloat imageW = imageFrame.size.width;
    CGFloat imageH = imageFrame.size.height;

    CGFloat titleX = imageX - titleFrame.size.width;
    CGFloat titleY = titleFrame.origin.y;
    CGFloat titleW = titleFrame.size.width;
    CGFloat titleH = titleFrame.size.height;

    titleX = titleX - _yl_titleInsets.right + _yl_titleInsets.left;
    titleY = titleY + _yl_titleInsets.top - _yl_titleInsets.bottom;
    self.titleLabel.frame = CGRectMake(titleX, titleY, titleW, titleH);

    imageX = imageX - _yl_imageInsets.right + _yl_imageInsets.left;
    imageY = imageY + _yl_imageInsets.top - _yl_imageInsets.bottom;
    self.imageView.frame = CGRectMake(imageX, imageY, imageW, imageH);
}

#pragma mark LayoutTop

- (void)imageAlignmentLayoutTop {

    CGRect imageFrame = self.imageView.frame;
    CGRect titleFrame = self.titleLabel.frame;

    NSInteger imageY = 0.5 * (self.frame.size.height - imageFrame.size.height - titleFrame.size.height);
    imageFrame.origin.y = imageY;

    CGPoint imageCenter = self.imageView.center;
    imageCenter.x = self.frame.size.width * 0.5;
    self.imageView.center = imageCenter;

    CGPoint titleCenter = self.titleLabel.center;
    titleCenter.x = self.frame.size.width * 0.5;
    self.titleLabel.center = titleCenter;

    CGFloat titleY = CGRectGetMaxY(imageFrame);

    imageFrame = self.imageView.frame;
    CGFloat imageX = imageFrame.origin.x;
    imageX = imageX - _yl_imageInsets.right + _yl_imageInsets.left;
    imageY = imageY + _yl_imageInsets.top - _yl_imageInsets.bottom;
    self.imageView.frame = CGRectMake(imageX, imageY, imageFrame.size.width, imageFrame.size.height);

    titleFrame = self.titleLabel.frame;
    CGFloat titleX = titleFrame.origin.x;
    CGFloat titleW = titleFrame.size.width;
    CGFloat titleH = titleFrame.size.height;
    titleX = titleX - _yl_titleInsets.right + _yl_titleInsets.left;
    titleY = titleY + _yl_titleInsets.top - _yl_titleInsets.bottom;
    self.titleLabel.frame = CGRectMake(titleX, titleY, titleW, titleH);

}

#pragma mark LayoutBottom

- (void)imageAlignmentLayoutBottom {

    CGRect imageFrame = self.imageView.frame;
    CGRect titleFrame = self.titleLabel.frame;

    CGFloat titleX = 0.5 * (self.frame.size.width - titleFrame.size.width);
    CGFloat titleY = 0.5 * (self.frame.size.height - imageFrame.size.height - titleFrame.size.height);
    CGFloat titleW = titleFrame.size.width;
    CGFloat titleH = titleFrame.size.height;

    imageFrame.origin.y =  titleY + titleH;
    self.imageView.frame = imageFrame;

    CGPoint imageCenter = self.imageView.center;
    imageCenter.x = self.frame.size.width * 0.5;
    self.imageView.center = imageCenter;

    CGRect imageFrameNew = self.imageView.frame;
    CGFloat imageX = imageFrameNew.origin.x - _yl_imageInsets.right + _yl_imageInsets.left;
    CGFloat imageY = imageFrameNew.origin.y + _yl_imageInsets.top - _yl_imageInsets.bottom;
    self.imageView.frame = CGRectMake(imageX, imageY, imageFrame.size.width, imageFrame.size.height);

    titleX = titleX - _yl_titleInsets.right + _yl_titleInsets.left;
    titleY = titleY + _yl_titleInsets.top - _yl_titleInsets.bottom;
    self.titleLabel.frame = CGRectMake(titleX, titleY, titleW, titleH);
}

#pragma mark - getter & setter

- (void)setImageAlignment:(YLImageAlignment)imageAlignment{

    if (_imageAlignment != imageAlignment) {

        _imageAlignment = imageAlignment;
        [self setNeedsLayout];
    }
}

- (void)setYl_imageInsets:(UIEdgeInsets)yl_imageInsets {

    _yl_imageInsets = yl_imageInsets;
    [self setNeedsLayout];
}

- (void)setYl_titleInsets:(UIEdgeInsets)yl_titleInsets {

    _yl_titleInsets = yl_titleInsets;
    [self setNeedsLayout];
}

#pragma mark - 重写set方法
- (void)setImageEdgeInsets:(UIEdgeInsets)imageEdgeInsets {
    if (_imageAlignment != YLImageAlignmentLeft) {
        printf("请使用 ' yl_imageInsets ' 属性 设置图片偏移");
        return;
    }

    [super setImageEdgeInsets:imageEdgeInsets];
}

- (void)setTitleEdgeInsets:(UIEdgeInsets)titleEdgeInsets {
    if (_imageAlignment != YLImageAlignmentLeft) {
        printf("请使用 ' yl_titleInsets ' 属性 设置文字偏移");
        return;
    }

    [super setTitleEdgeInsets:titleEdgeInsets];
}

#pragma mark - 按钮点击时间间隔
/** 默认的按钮点击时间 */
static const NSTimeInterval defaultDuration = 0.0;
/** 记录是否忽略按钮点击事件，默认第一次执行事件 */
static BOOL _isIgnoreEvent = NO;
/** 设置执行按钮事件状态 */
static void resetState() {
    _isIgnoreEvent = NO;
}
// 在这方法搅拌
+ (void)load {

    Method originMethod = class_getInstanceMethod([self class], @selector(sendAction:to:forEvent:));
    Method newMethod = class_getInstanceMethod([self class], @selector(yl_sendAction:to:forEvent:));

    method_exchangeImplementations(originMethod, newMethod);
}

- (void)yl_sendAction:(SEL)action to:(id)target forEvent:(UIEvent *)event {

    if ([self isKindOfClass:[YLButton class]]) {
        //1. 按钮点击间隔事件
        self.clickDurationTime = self.clickDurationTime == 0 ? defaultDuration : self.clickDurationTime;

        //2. 是否忽略按钮点击事件
        if (_isIgnoreEvent) {
            //2.1 忽略按钮事件

            // 直接拦截掉super函数进行发送消息
            return;

        }
        else if(self.clickDurationTime > 0) {
            //2.2 不忽略按钮事件

            // 后续在间隔时间内直接忽略按钮事件
            _isIgnoreEvent = YES;

            // 间隔事件后，执行按钮事件
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(self.clickDurationTime * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                resetState();
            });

            // 发送按钮点击消息
            [self yl_sendAction:action to:target forEvent:event];
        }
        else{
            [self yl_sendAction:action to:target forEvent:event];
        }
    }
    else {
        [self yl_sendAction:action to:target forEvent:event];
    }
}


@end
