路由基础构建

1. 创建`UIViewController`扩展`UIViewController+JumpRute`

**UIViewController+JumpRoute.h**

```objc
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIViewController (JumpRoute)

/**
 通过连接

 @param Info 跳转所带基本信息 - model等
 @param URLScheme 跳转标记
 */
- (void)HandleURLWithInfo:(id)Info URLScheme:(NSString *)URLScheme;

@end

NS_ASSUME_NONNULL_END
```

**UIViewController+JumpRoute.m**

```objc
#import "UIViewController+JumpRoute.h"
#import "BaseWebViewController.h"
#import "BaseViewController.h"
#import "BaseModel.h"

@implementation UIViewController (JumpRoute)

- (void)HandleURLWithInfo:(id)Info URLScheme:(NSString *)URLScheme {
    NSLog(@"%@-----%@", Info, URLScheme);
    URLScheme = [URLScheme stringByReplacingOccurrencesOfString:@" " withString:@""];
    NSLog(@"%@-----%@", Info, URLScheme);
    if ([URLScheme myContainsString:@"ZHY_WH://"]) { //
        [self JumpWebViewWithInfo:Info URLScheme:URLScheme];
    } else if ([URLScheme myContainsString:@"ZHY_NH://"]){
        [self JumpNativeWithInfo:Info URLScheme:URLScheme];
    } else if ([URLScheme hasPrefix:@"http"]){
        BaseWebViewController *baseView = [[BaseWebViewController alloc]init];
        baseView.linkUrl = URLScheme;
        baseView.title = Info;
        [self.navigationController pushViewController:baseView animated:YES];
    }
}


/**
 跳转原生页面
 ZHY_NH://OpenBaseViewController  打开视图控制器

 @param Info 跳转时带有的基本信息
 @param URLScheme 跳转标记
 */
- (void)JumpNativeWithInfo:(id)Info URLScheme:(NSString *)URLScheme {
    
    if ([URLScheme myContainsString:@"OpenBaseViewController"]) {
        BaseViewController *VC = [[BaseViewController alloc] init];
        VC.model = Info;
        [self.navigationController pushViewController:VC animated:YES];
    }
}


/**
 跳转网络页面
 
ZHY_WH://OpenBaseWebViewController/URL=   打开视图控制器

 @param Info 跳转基本信息
 @param URLScheme 标砖标记
 */
- (void)JumpWebViewWithInfo:(id)Info URLScheme:(NSString *)URLScheme {
    
    NSString * linkUrl = [[URLScheme componentsSeparatedByString:@"URL="] lastObject];
    
    if ([URLScheme myContainsString:@"OpenBaseWebViewController"]) {
        BaseWebViewController *VC = [[BaseWebViewController alloc] init];
        VC.model = Info;
        VC.linkUrl = linkUrl;
        [self.navigationController pushViewController:VC animated:YES];
    }
}



@end
```

2. 调取路由跳转页面

```objc
- (IBAction)buttonClick:(UIButton *)sender {
    
    if (sender.tag == 10001) { // 跳转基础页面
        BaseModel *model = [[BaseModel alloc] init];
        model.title = @"基础页面";
        [self HandleURLWithInfo:model URLScheme:@"ZHY_NH://OpenBaseViewController"];
    } else if (sender.tag == 10002) { // 跳转web页面
        BaseModel *model = [[BaseModel alloc] init];
        model.title = @"网络页面";
        [self HandleURLWithInfo:model URLScheme:@"ZHY_WH://OpenBaseWebViewController/URL=https://github.com/anchoriteFili/ZHYRoutes"];
    } else { // 直接连接跳转
        // 跳转web页面
        [self HandleURLWithInfo:@"百度" URLScheme:@"https://www.baidu.com"];
    }
}
```
<br>

![](https://github.com/anchoriteFili/ZHYRoutes/blob/master/ZHYRoutes.gif)