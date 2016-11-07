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


@end
