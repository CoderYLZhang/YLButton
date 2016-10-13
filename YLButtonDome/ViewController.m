//
//  ViewController.m
//  YLButtonDome
//
//  Created by yinlong on 16/10/13.
//  Copyright © 2016年 yinlong. All rights reserved.
//

#import "ViewController.h"
#import "YLButton.h"


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
    [self buttonFive];
}

- (void)buttonOne{

    YLButton *button = [YLButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(50, 100, 100, 30);
    [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [button setTitle:@"buttonOne" forState:UIControlStateNormal];
    [button setImage:_myImg forState:UIControlStateNormal];
    button.backgroundColor = [UIColor redColor];
    button.titleLabel.backgroundColor = [UIColor grayColor];
    [self.view addSubview:button];
}

- (void)buttonTwo{

    YLButton *button = [YLButton buttonWithType:UIButtonTypeCustom];
    button.yl_imageInsets = UIEdgeInsetsMake(0, 10, 10, 0);
    button.yl_titleInsets = UIEdgeInsetsMake(10, 0, 0, 10);
    button.imageAlignment = YLImageAlignmentRight;
    button.frame = CGRectMake(200, 100, 100, 30);
    [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [button setTitle:@"buttonTwo" forState:UIControlStateNormal];
    [button setImage:_myImg forState:UIControlStateNormal];
    button.backgroundColor = [UIColor redColor];
    button.titleLabel.backgroundColor = [UIColor grayColor];
    [self.view addSubview:button];
}

- (void)buttonThree{

    YLButton *button = [YLButton buttonWithType:UIButtonTypeCustom];
    button.imageAlignment = YLImageAlignmentTop;
    button.frame = CGRectMake(50, 200, 100, 30);
    button.yl_imageInsets = UIEdgeInsetsMake(0, 10, 10, 0);
    button.yl_titleInsets = UIEdgeInsetsMake(10, 0, 0, 10);
    [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [button setTitle:@"buttonThree" forState:UIControlStateNormal];
    [button setImage:_myImg forState:UIControlStateNormal];
    button.backgroundColor = [UIColor redColor];
    button.titleLabel.backgroundColor = [UIColor grayColor];
    [self.view addSubview:button];
}

- (void)buttonFore{

    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(150, 50, 100, 30);
    [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [button setTitle:@"UIButton" forState:UIControlStateNormal];
    [button setImage:_myImg forState:UIControlStateNormal];
    button.backgroundColor = [UIColor redColor];
    button.titleLabel.backgroundColor = [UIColor grayColor];
    [self.view addSubview:button];
}

- (void)buttonFive {
    YLButton *button = [YLButton buttonWithType:UIButtonTypeCustom];
    button.yl_imageInsets = UIEdgeInsetsMake(10, 0, 0, 10);
    button.yl_titleInsets = UIEdgeInsetsMake(0, 10, 10, 0);
    button.imageAlignment = YLImageAlignmentBottom;
    button.frame = CGRectMake(200, 200, 100, 30);
    [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [button setTitle:@"buttonFive" forState:UIControlStateNormal];
    [button setImage:_myImg forState:UIControlStateNormal];
    button.backgroundColor = [UIColor redColor];
    button.titleLabel.backgroundColor = [UIColor grayColor];
    [self.view addSubview:button];
}

@end
