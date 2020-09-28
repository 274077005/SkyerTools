//
//  CategoryListController.h
//  NotebookApp
//
//  Created by 滕应伟 on 2020/6/12.
//  Copyright © 2020 滕应伟. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface CategoryListController : UIViewController

@property (nonatomic ,strong) NSMutableDictionary * dic;
@property (nonatomic ,assign) NSInteger index;

@property (nonatomic ,copy) void(^reloadBlock)(NSDictionary * dic);


@end

NS_ASSUME_NONNULL_END
