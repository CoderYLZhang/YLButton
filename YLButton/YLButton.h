//
//  YLButton.h
//  
//
//  Created by 张银龙 on 14/12/8.
//  Copyright © 2014年 张银龙. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger, YLImageAlignment) {
    YLImageAlignmentLeft,
    YLImageAlignmentRight,
    YLImageAlignmentTop,
    YLImageAlignmentBottom
};


@interface YLButton : UIButton

@property(nonatomic,assign) YLImageAlignment imageAlignment;

@property(nonatomic,assign) UIEdgeInsets yl_imageInsets;

@property(nonatomic,assign) UIEdgeInsets yl_titleInsets;

@end
