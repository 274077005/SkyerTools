//
//  DetailController.h
//  NotebookApp
//
//  Created by 滕应伟 on 2020/6/12.
//  Copyright © 2020 滕应伟. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface DetailController : UIViewController

@property (nonatomic ,copy) void(^contentBlock)(NSDictionary * dic);

@property (nonatomic ,strong) NSMutableDictionary * dic;

@end

NS_ASSUME_NONNULL_END
