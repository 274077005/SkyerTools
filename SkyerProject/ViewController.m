//
//  ViewController.m
//  SkyerProject
//
//  Created by SoKing on 2017/11/8.
//  Copyright © 2017年 skyer. All rights reserved.
//

#import "ViewController.h"
#import "SkyerTools.h"


@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    dataTool *data=[dataTool new];
    NSLog(@"%@",data);
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
