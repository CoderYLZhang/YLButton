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
#import "YLButtonViewController.h"

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>

/**  */


/**  */
@property (nonatomic, strong) NSArray *itemArray;

/**  */
@property (nonatomic, strong) UITableView *tableView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    

    self.itemArray = @[
                       @"YLImageAlignmentLeft",
                       @"YLImageAlignmentRight",
                       @"YLImageAlignmentTop",
                       @"YLImageAlignmentBottom"
                       ];

    [self.view addSubview:self.tableView];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.itemArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{

    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"YLButton"];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"YLButton"];
    }

    cell.textLabel.text = self.itemArray[indexPath.row];

    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {


    YLButtonViewController *VC = [[YLButtonViewController alloc]init];
    VC.imageAlignment = (YLImageAlignment)indexPath.row;
    [self.navigationController pushViewController:VC animated:YES];

    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

- (UITableView *)tableView {
    if (!_tableView) {
        CGRect tableFrame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height - 60);
        UITableView *table = [[UITableView alloc]initWithFrame:tableFrame style:UITableViewStyleGrouped];
        table.delegate = self;
        table.dataSource = self;
        _tableView = table;
    }
    return _tableView;
}





@end
