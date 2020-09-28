//
//  CategoryListController.m
//  NotebookApp
//
//  Created by 滕应伟 on 2020/6/12.
//  Copyright © 2020 滕应伟. All rights reserved.
//

#import "CategoryListController.h"
#import "Tools.h"
#import "DetailController.h"

@interface CategoryListController ()<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;

@property (nonatomic ,strong) NSMutableArray * dataSource;
@property (nonatomic ,strong) UILabel * emptyLabel;

@end

@implementation CategoryListController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = [self.dic objectForKey:@"title"];
    self.view.backgroundColor = [UIColor whiteColor];
    UIBarButtonItem * rightButton = [[UIBarButtonItem alloc] initWithTitle:@"新建" style:UIBarButtonItemStylePlain target:self action:@selector(action_rightButtonClick)];
    self.navigationItem.rightBarButtonItem = rightButton;
    
    [self.view addSubview:self.tableView];
    [self.view addSubview:self.emptyLabel];
}

- (void)action_rightButtonClick
{
    DetailController * vc = [[DetailController alloc] init];
    __weak __typeof(&*self)wSelf = self;
    vc.contentBlock = ^(NSDictionary * _Nonnull dic) {
        [wSelf.dataSource addObject:dic];
        [Tools reloadSimpleData:wSelf.dataSource key:[wSelf.dic objectForKey:@"title"]];
        [wSelf.dic setValue:@(wSelf.dataSource.count) forKey:@"count"];
        if (wSelf.reloadBlock) {
            wSelf.reloadBlock(wSelf.dic);
        }
        [wSelf.tableView reloadData];
    };
    [self.navigationController pushViewController:vc animated:true];
}

#pragma mark -- UITableView Delegate

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
        cell = [[UITableViewCell alloc] initWithStyle:(UITableViewCellStyleSubtitle) reuseIdentifier:cellIdentifier];
    }
    NSDictionary * dic = self.dataSource[indexPath.row];
    cell.textLabel.text = [dic objectForKey:@"title"];
    cell.detailTextLabel.text = [dic objectForKey:@"time"];
    cell.accessoryType=UITableViewCellAccessoryDisclosureIndicator;
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    NSDictionary * dic = self.dataSource[indexPath.row];
    
    DetailController * vc = [[DetailController alloc] init];
    vc.dic = [NSMutableDictionary dictionaryWithDictionary:dic];
    __weak __typeof(&*self)wSelf = self;
    vc.contentBlock = ^(NSDictionary * _Nonnull dic) {
        [wSelf.dataSource replaceObjectAtIndex:indexPath.row withObject:dic];
        [Tools reloadSimpleData:wSelf.dataSource key:[wSelf.dic objectForKey:@"title"]];
        [wSelf.tableView reloadRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    };
    [self.navigationController pushViewController:vc animated:true];
}


- (NSArray *)tableView:(UITableView *)tableView editActionsForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    UITableViewRowAction *action0 = [UITableViewRowAction rowActionWithStyle:UITableViewRowActionStyleNormal title:@"删除" handler:^(UITableViewRowAction *action, NSIndexPath *indexPath) {
        tableView.editing = NO;
        [self.dataSource removeObjectAtIndex:indexPath.row];
        [Tools reloadSimpleData:self.dataSource key:[self.dic objectForKey:@"title"]];
        [self.dic setValue:@(self.dataSource.count) forKey:@"count"];
        if (self.reloadBlock) {
            self.reloadBlock(self.dic);
        }
        [self.tableView reloadData];
    }];
    
    return @[action0];
}


#pragma mark -- Getter


- (NSMutableArray *)dataSource
{
    if (!_dataSource) {
        NSString * title = [_dic objectForKey:@"title"];
        NSArray * arr = [Tools getSimpleData:title];
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
