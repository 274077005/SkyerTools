//
//  ViewController.m
//  SkyerProject
//
//  Created by SoKing on 2017/12/20.
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

    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [skImagePicker showImagePickerFromViewController:self allowsEditing:NO finishAction:^(UIImage *image) {
        NSData *imageData=UIImageJPEGRepresentation(image,1);
        NSString *imageSize=[NSByteCountFormatter stringFromByteCount:imageData.length countStyle:NSByteCountFormatterCountStyleFile];
        
    }];
}

@end
