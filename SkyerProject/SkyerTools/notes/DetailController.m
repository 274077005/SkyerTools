//
//  DetailController.m
//  NotebookApp
//
//  Created by 滕应伟 on 2020/6/12.
//  Copyright © 2020 滕应伟. All rights reserved.
//

#import "DetailController.h"
#import "TKTextView.h"
#import "Tools.h"

@interface DetailController ()

@property (nonatomic ,strong) TKTextView * textView;

@end

@implementation DetailController

- (void)viewDidLoad {
    [super viewDidLoad];
    if (self.dic) {
        self.title = [self.dic objectForKey:@"title"];
        self.textView.text = [self.dic objectForKey:@"content"];
    } else {
        self.title = @"新建备忘录";
    }
    UIBarButtonItem * rightButton = [[UIBarButtonItem alloc] initWithTitle:@"保存" style:UIBarButtonItemStylePlain target:self action:@selector(action_rightButtonClick)];
    self.navigationItem.rightBarButtonItem = rightButton;
    self.view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.textView];
}

- (void)action_rightButtonClick
{
    NSString * text = self.textView.text;
    if (text.length == 0) {
        return;
    }
    
    NSString * title = text.length < 10 ? text : [text substringToIndex:9];
    NSString * time = [Tools dateFormatWithDate:[NSDate now] format:@"yyyy-MM-dd HH:mm"];
    NSDictionary * dic = @{@"title":title,
                           @"time":time,
                           @"content":text
    };
    
    self.dic = [NSMutableDictionary dictionaryWithDictionary:dic];
    
    if (self.contentBlock) {
        self.contentBlock(self.dic);
        [self.navigationController popViewControllerAnimated:true];
    }
}



- (TKTextView *)textView
{
    if (!_textView) {
        _textView = [[TKTextView alloc] init];
        _textView.backgroundColor = [UIColor whiteColor];
        _textView.frame = self.view.bounds;
        _textView.font = [UIFont systemFontOfSize:14];
        _textView.placeholder = @"请输入备忘录内容";
    }
    return _textView;
}

@end
