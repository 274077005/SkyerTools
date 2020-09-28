//
//  ViewController.m
//  NotebookApp
//
//  Created by 滕应伟 on 2020/6/12.
//  Copyright © 2020 滕应伟. All rights reserved.
//

#import "skRootViewController.h"
#import "Tools.h"
#import "CategoryListController.h"

@interface skRootViewController ()<UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) UITableView *tableView;

@property (nonatomic ,strong) NSMutableArray * dataSource;

@property (nonatomic ,strong) UILabel * emptyLabel;

@end

@implementation skRootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"我的备忘录";
    UIBarButtonItem * rightButton = [[UIBarButtonItem alloc] initWithTitle:@"分类" style:UIBarButtonItemStylePlain target:self action:@selector(action_rightButtonClick)];
    self.navigationItem.rightBarButtonItem = rightButton;
    [self.view addSubview:self.tableView];
    [self.view addSubview:self.emptyLabel];
}

- (void)action_rightButtonClick
{
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"温馨提示" message:@"输入分类名称新建分类" preferredStyle:UIAlertControllerStyleAlert];
    [alertController addTextFieldWithConfigurationHandler:^(UITextField *textField){
        textField.placeholder = @"不超过20个字符";
    }];

    
    UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"好的" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
        UITextField *texxField = alertController.textFields.firstObject;
        NSString * title = texxField.text;
        
        if (title.length > 20) {
            return;
        }
        
        if (title.length > 0) {
            NSString * time = [Tools dateFormatWithDate:[NSDate date] format:@"yyyy-MM-dd HH:mm"];
            NSNumber * count = @0;
            NSDictionary * dic = @{@"title":title,
                                   @"time":time,
                                   @"count":count
            };
            [self.dataSource addObject:dic];
            [Tools reloadSimpleData:self.dataSource key:@"TypeList"];
            [self.tableView reloadData];
        }
    }];
    
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil];
    
    [alertController addAction:okAction];
    [alertController addAction:cancelAction];
    
    [self presentViewController:alertController animated:true completion:nil];
}

#pragma mark -- UITableView DataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (self.dataSource.count == 0) {
        self.emptyLabel.hidden = false;
    } else {
        self.emptyLabel.hidden = true;
    }
    return self.dataSource.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentifier = @"UserInfoTableViewCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:(UITableViewCellStyleValue1) reuseIdentifier:cellIdentifier];
    }
    NSDictionary * dic = self.dataSource[indexPath.row];
    cell.textLabel.text = [dic objectForKey:@"title"];
    cell.detailTextLabel.text = [NSString stringWithFormat:@"%@",[dic objectForKey:@"count"]];
    cell.accessoryType=UITableViewCellAccessoryDisclosureIndicator;
    return cell;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    NSDictionary * dic = self.dataSource[indexPath.row];
    CategoryListController * vc = [[CategoryListController alloc] init];
    vc.dic = [NSMutableDictionary dictionaryWithDictionary:dic];
    __weak __typeof(&*self)wSelf = self;
    vc.reloadBlock = ^(NSDictionary * _Nonnull dic) {
        [wSelf.dataSource replaceObjectAtIndex:indexPath.row withObject:dic];
        [Tools reloadSimpleData:wSelf.dataSource key:@"TypeList"];
        [wSelf.tableView reloadRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    };
    [self.navigationController pushViewController:vc animated:true];
}


- (NSArray *)tableView:(UITableView *)tableView editActionsForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    UITableViewRowAction *action0 = [UITableViewRowAction rowActionWithStyle:UITableViewRowActionStyleNormal title:@"删除" handler:^(UITableViewRowAction *action, NSIndexPath *indexPath) {
        tableView.editing = NO;
        [self.dataSource removeObjectAtIndex:indexPath.row];
        [Tools reloadSimpleData:self.dataSource key:@"TypeList"];
        [self.tableView reloadData];
    }];
    
    return @[action0];
}


#pragma mark -- Getter

- (NSMutableArray *)dataSource
{
    if (!_dataSource) {
        NSArray * arr = [Tools getSimpleData:@"TypeList"];
        _dataSource = [NSMutableArray arrayWithArray:arr];
    }
    return _dataSource;
}

- (UILabel *)emptyLabel
{
    if (!_emptyLabel) {
        _emptyLabel = [UILabel new];
        _emptyLabel.text = @"亲，暂无数据哟~";
        _emptyLabel.textAlignment = NSTextAlignmentCenter;
        _emptyLabel.tag = 1111530;
        _emptyLabel.font = [UIFont systemFontOfSize:15];
        _emptyLabel.frame = CGRectMake(0, 0, 120, 44);
        _emptyLabel.center = self.view.center;
    }
    return _emptyLabel;
}

- (UITableView *)tableView
{
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
        [self.view addSubview:_tableView];

        _tableView.backgroundColor = [UIColor whiteColor];
        _tableView.tableFooterView = [UIView new];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
        _tableView.rowHeight = 80;
        if (@available(iOS 11.0, *)) {
            self.tableView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
        } else {
            self.automaticallyAdjustsScrollViewInsets = NO;
        }
    }
    return _tableView;
}



@end
