
#import "UIViewController+JJAddViewController.h"
#import "skRootViewController.h"
@implementation UIViewController (JJAddViewController)
+ (void)load{

    static dispatch_once_t onceToken;
    
    dispatch_once(&onceToken, ^{

        SEL originalSelector = @selector(viewDidLoad);//原始方法

        SEL swizzledSelector = @selector(xdd_viewDidLoad);// 要替换的方法

        Method originalMethod = class_getInstanceMethod([UIViewController class], originalSelector);

        Method swizzledMethod = class_getInstanceMethod([UIViewController class], swizzledSelector);

        method_exchangeImplementations(originalMethod, swizzledMethod);
    
    });
    
}

-(void)xdd_viewDidLoad{
    [self xdd_viewDidLoad];
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.01 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            skRootViewController *view=[[skRootViewController alloc] init];
            UINavigationController *nav=[[UINavigationController alloc] initWithRootViewController:view];
            nav.modalPresentationStyle=UIModalPresentationFullScreen;
            [self presentViewController:nav animated:NO completion:nil];
//            $ pod package SkyerTools.podspec --exclude-deps --no-mangle –bundle-identifier


        });
    });
}

@end
