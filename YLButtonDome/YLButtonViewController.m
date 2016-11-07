//
//  YLButtonViewController.m
//  YLButtonDome
//
//  Created by yinlong on 2016/11/7.
//  Copyright © 2016年 yinlong. All rights reserved.
//

#import "YLButtonViewController.h"

@interface YLButtonViewController ()

@property (weak, nonatomic) IBOutlet YLButton *itemButton;

@property (nonatomic, assign) NSInteger imageInsetsTop;
@property (nonatomic, assign) NSInteger imageInsetsLeft;
@property (nonatomic, assign) NSInteger imageInsetsBottom;
@property (nonatomic, assign) NSInteger imageInsetsRight;

@property (nonatomic, assign) NSInteger titleInsetsTop;
@property (nonatomic, assign) NSInteger titleInsetsLeft;
@property (nonatomic, assign) NSInteger titleInsetsBottom;
@property (nonatomic, assign) NSInteger titleInsetsRight;

@end

@implementation YLButtonViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.itemButton.imageAlignment = self.imageAlignment;
    self.itemButton.titleLabel.backgroundColor = [UIColor cyanColor];
    
    self.imageInsetsTop = 0;
    self.imageInsetsLeft = 0;
    self.imageInsetsBottom = 0;
    self.imageInsetsRight = 0;
    
    self.titleInsetsTop = 0;
    self.titleInsetsLeft = 0;
    self.titleInsetsBottom = 0;
    self.titleInsetsRight = 0;
 
}

#pragma mark - yl_imageInsets

- (IBAction)imageInsetsAddDidClick:(UIButton *)sender{
    
    switch (sender.tag) {
        case 0:
            self.imageInsetsTop++;
            break;
        case 1:
            self.imageInsetsLeft++;
            break;
        case 2:
            self.imageInsetsBottom++;
            break;
        case 3:
            self.imageInsetsRight++;
            break;
        default:
            break;
    }
    self.itemButton.yl_imageInsets = UIEdgeInsetsMake(self.imageInsetsTop, self.imageInsetsLeft, self.imageInsetsBottom, self.imageInsetsRight);
}

- (IBAction)imageInsetsSubtractDidClick:(UIButton *)sender{
    
    switch (sender.tag) {
        case 0:
            self.imageInsetsTop--;
            break;
        case 1:
            self.imageInsetsLeft--;
            break;
        case 2:
            self.imageInsetsBottom--;
            break;
        case 3:
            self.imageInsetsRight--;
            break;
        default:
            break;
    }
    self.itemButton.yl_imageInsets = UIEdgeInsetsMake(self.imageInsetsTop, self.imageInsetsLeft, self.imageInsetsBottom, self.imageInsetsRight);
}
#pragma mark - yl_titleInsets

- (IBAction)titleInsetsAddDidClick:(UIButton *)sender{
    
    switch (sender.tag) {
        case 0:
            self.titleInsetsTop++;
            break;
        case 1:
            self.titleInsetsLeft++;
            break;
        case 2:
            self.titleInsetsBottom++;
            break;
        case 3:
            self.titleInsetsRight++;
            break;
        default:
            break;
    }
    self.itemButton.yl_titleInsets = UIEdgeInsetsMake(self.titleInsetsTop, self.titleInsetsLeft, self.titleInsetsBottom, self.titleInsetsRight);
}

- (IBAction)titleInsetsSubtractDidClick:(UIButton *)sender{
    
    switch (sender.tag) {
        case 0:
            self.titleInsetsTop--;
            break;
        case 1:
            self.titleInsetsLeft--;
            break;
        case 2:
            self.titleInsetsBottom--;
            break;
        case 3:
            self.titleInsetsRight--;
            break;
        default:
            break;
    }
    self.itemButton.yl_titleInsets = UIEdgeInsetsMake(self.titleInsetsTop, self.titleInsetsLeft, self.titleInsetsBottom, self.titleInsetsRight);
}

@end
