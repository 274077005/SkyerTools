//
//  ViewController.m
//  SkyerProject
//
//  Created by SoKing on 2017/11/8.
//  Copyright © 2017年 skyer. All rights reserved.
//

#import "ViewController.h"
#import "SkLocation.h"


@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    SkLocation.sharedSkLocation.skInitMannager().skStopUpdateLocation().locations = ^(NSArray *locations) {
        NSLog(@"%@",locations);
    };
    
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
}

@end
