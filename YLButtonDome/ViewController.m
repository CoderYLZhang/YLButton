//
//  ViewController.m
//  YLButtonDome
//
//  Created by yinlong on 16/10/13.
//  Copyright © 2016年 yinlong. All rights reserved.
//

#import "ViewController.h"
#import "YLButton.h"
#import "YLAlertTool.h"


@interface ViewController ()

/**  */
@property (nonatomic, strong) UIImage *myImg;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.myImg = [UIImage imageNamed:@"bg"];

    [self buttonOne];
    [self buttonTwo];
    [self buttonThree];
    [self buttonFore];
    [self buttonUIButton];
}
- (void)buttonDidClick:(YLButton*)button {

    //[YLAlertTool showAlertWithTitle:[NSString stringWithFormat:@"此button %@ 秒响应一次事件",@(button.clickDurationTime)]];
}

- (void)buttonOne{

    YLButton *button = [YLButton buttonWithType:UIButtonTypeCustom];
    button.titleEdgeInsets = UIEdgeInsetsMake(10, 0, 0, 0);
    button.frame = CGRectMake(50, 100, 150, 50);
    [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [button setTitle:@"buttonOne" forState:UIControlStateNormal];
    [button setImage:_myImg forState:UIControlStateNormal];
    button.backgroundColor = [UIColor redColor];
    button.titleLabel.backgroundColor = [UIColor grayColor];
    [button addTarget:self action:@selector(buttonDidClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
}

- (void)buttonTwo{

    YLButton *button = [YLButton buttonWithType:UIButtonTypeCustom];
    button.imageAlignment = YLImageAlignmentRight;
    //button.clickDurationTime = 3;
    button.frame = CGRectMake(50, 200, 150, 50);
    //button.yl_titleInsets = UIEdgeInsetsMake(10, 0, 0, 0);
    [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [button setTitle:@"buttonTwo" forState:UIControlStateNormal];
    [button setImage:_myImg forState:UIControlStateNormal];
    button.backgroundColor = [UIColor redColor];
    button.titleLabel.backgroundColor = [UIColor grayColor];
    [button addTarget:self action:@selector(buttonDidClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
}

- (void)buttonThree{

    YLButton *button = [YLButton buttonWithType:UIButtonTypeCustom];
    button.imageAlignment = YLImageAlignmentTop;
    button.frame = CGRectMake(50, 300, 150, 50);
    //button.yl_imageInsets = UIEdgeInsetsMake(10, 0, 0, 0);
    [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [button setTitle:@"buttonThree" forState:UIControlStateNormal];
    [button setImage:_myImg forState:UIControlStateNormal];
    button.backgroundColor = [UIColor redColor];
    button.titleLabel.backgroundColor = [UIColor grayColor];
    [button addTarget:self action:@selector(buttonDidClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
}

- (void)buttonFore {
    
    YLButton *button = [YLButton buttonWithType:UIButtonTypeCustom];
    button.imageAlignment = YLImageAlignmentBottom;
    button.frame = CGRectMake(50, 400, 150, 50);
    button.yl_titleInsets = UIEdgeInsetsMake(10, 0, 0, 0);
    [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [button setTitle:@"buttonFore" forState:UIControlStateNormal];
    [button setImage:_myImg forState:UIControlStateNormal];
    button.backgroundColor = [UIColor redColor];
    button.titleLabel.backgroundColor = [UIColor grayColor];
    [button addTarget:self action:@selector(buttonDidClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
}

- (void)buttonUIButton{

    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(50, 500, 150, 50);
    [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [button setTitle:@"UIButton" forState:UIControlStateNormal];
    [button setImage:_myImg forState:UIControlStateNormal];
    button.backgroundColor = [UIColor redColor];
    button.titleLabel.backgroundColor = [UIColor grayColor];
    [self.view addSubview:button];
}

@end
