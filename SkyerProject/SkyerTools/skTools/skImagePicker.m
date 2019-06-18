//
//  ImagePicker.m
//  BDKit
//
//  Created by Liu Jinyong on 16/1/20.
//  Copyright © 2016年 Baidu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "skImagePicker.h"

@interface skImagePicker()<UIActionSheetDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate>

@property (nonatomic, weak) UIViewController *viewController;
@property (nonatomic, copy) BDImagePickerFinishAction finishAction;
@property (nonatomic, assign) BOOL allowsEditing;

@end


static skImagePicker *bdImagePickerInstance = nil;

@implementation skImagePicker

+ (void)showImagePickerFromViewController:(UIViewController *)viewController
                            allowsEditing:(BOOL)allowsEditing
                            finishAction:(BDImagePickerFinishAction)finishAction{
    if (bdImagePickerInstance == nil) {
        bdImagePickerInstance = [[skImagePicker alloc] init];
    }
    
    [bdImagePickerInstance showImagePickerFromViewController:viewController
                                               allowsEditing:allowsEditing
                                                finishAction:finishAction];
}

- (void)showImagePickerFromViewController:(UIViewController *)viewController
                            allowsEditing:(BOOL)allowsEditing
                            finishAction:(BDImagePickerFinishAction)finishAction {
    _viewController = viewController;
    _finishAction = finishAction;
    _allowsEditing = allowsEditing;
    
    
    UIAlertController *view=[UIAlertController alertControllerWithTitle:nil message:nil preferredStyle:(UIAlertControllerStyleActionSheet)];
    
    UIAlertAction *action1=[UIAlertAction actionWithTitle:@"拍照" style:(UIAlertActionStyleDefault) handler:^(UIAlertAction * _Nonnull action) {
        UIImagePickerController *picker = [[UIImagePickerController alloc] init];
        picker.delegate = self;
        picker.sourceType = UIImagePickerControllerSourceTypeCamera;
        picker.allowsEditing = _allowsEditing;
        [_viewController presentViewController:picker animated:YES completion:nil];
    }];
    UIAlertAction *action2=[UIAlertAction actionWithTitle:@"相册" style:(UIAlertActionStyleDefault) handler:^(UIAlertAction * _Nonnull action) {
        UIImagePickerController *picker = [[UIImagePickerController alloc] init];
        picker.delegate = self;
        picker.allowsEditing = _allowsEditing;
        [_viewController presentViewController:picker animated:YES completion:nil];
    }];
    
    UIAlertAction *action3=[UIAlertAction actionWithTitle:@"取消" style:(UIAlertActionStyleCancel) handler:^(UIAlertAction * _Nonnull action) {
        bdImagePickerInstance = nil;
    }];
    
    
    if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
        [view addAction:action1];
    }
    [view addAction:action2];
    [view addAction:action3];
    [self.viewController presentViewController:view animated:YES completion:nil];
    
    
}

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info {
    UIImage *image = info[UIImagePickerControllerOriginalImage];
    
    if (image == nil) {
        image = info[UIImagePickerControllerOriginalImage];
    }
    NSData *imageData=UIImageJPEGRepresentation(image,1);//不压缩
    image = [UIImage imageWithData: imageData];
    if (_finishAction) {
        _finishAction(image);
    }
    
    [picker dismissViewControllerAnimated:YES completion:^{}];
    
    bdImagePickerInstance = nil;
}

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker {
    if (_finishAction) {
        _finishAction(nil);
    }
    
    [picker dismissViewControllerAnimated:YES completion:^{}];
    
    bdImagePickerInstance = nil;
}

@end
