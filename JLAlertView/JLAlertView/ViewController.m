//
//  ViewController.m
//  JLAlertView
//
//  Created by shijialong on 2016/12/5.
//  Copyright © 2016年 shijialong. All rights reserved.
//

#import "ViewController.h"
#import "JLAlertView.h"

#define KStatusBarHeight            [UIApplication sharedApplication].statusBarFrame.size.height
#define KScreenWidth                [UIScreen mainScreen].bounds.size.width
#define KScreenHeight               [UIScreen mainScreen].bounds.size.height


@interface ViewController ()<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSArray *dataArray;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.tableView];
}

#pragma mark - tableView Delegate & DataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    cell.textLabel.text = self.dataArray[indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    switch (indexPath.row) {
        case 0: {
            [JLAlertView showAlertViewWithTitle:@"这是一个alertView" contentView:[self customView] message:@"范晓萱范晓萱范晓萱范晓萱范晓萱范晓萱范晓萱范晓萱范晓萱范晓萱范晓萱范晓萱范晓萱" buttonTitles:@[@"确定"] buttonClickedBlock:^(JLAlertView * _Nonnull alertView, NSInteger index) {
                NSLog(@"点击了%zd",index);
            }];
        }
            break;
        case 1: {
            [JLAlertView showAlertViewWithTitle:@"这是一个alertView" contentView:[self customView] message:@"范晓萱范晓萱范晓萱范晓萱范晓萱范晓萱范晓萱范晓萱范晓萱范晓萱范晓萱范晓萱范晓萱" buttonTitles:@[@"确定",@"取消"] buttonClickedBlock:^(JLAlertView * _Nonnull alertView, NSInteger index) {
                NSLog(@"点击了%zd",index);
            }];
        }
            break;
        case 2: {
            [JLAlertView showAlertViewWithTitle:@"这是一个alertView" contentView:[self customView] message:@"范晓萱范晓萱范晓萱范晓萱范晓萱范晓萱范晓萱范晓萱范晓萱范晓萱范晓萱范晓萱范晓萱" buttonTitles:@[@"第一",@"第二",@"第三",@"第四",@"第五"] buttonClickedBlock:^(JLAlertView * _Nonnull alertView, NSInteger index) {
                NSLog(@"点击了%zd",index);
            }];
        }
            break;
        default:
            break;
    }
}

- (UIView *)customView
{
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 100, 100)];
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 100, 100)];
    imageView.image = [UIImage imageNamed:@"14.jpg"];
    [view addSubview:imageView];
    return view;
}

#pragma mark - 懒加载
- (UITableView *)tableView {
    if (_tableView == nil) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, KStatusBarHeight, KScreenWidth, KScreenHeight - KStatusBarHeight) style:UITableViewStylePlain];
        _tableView.backgroundColor = [UIColor whiteColor];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
        
    }
    return _tableView;
}

- (NSArray *)dataArray {
    if (_dataArray == nil) {
        _dataArray = @[@"一个按钮",@"两个个按钮",@"五个按钮"];
    }
    return _dataArray;
}

@end
