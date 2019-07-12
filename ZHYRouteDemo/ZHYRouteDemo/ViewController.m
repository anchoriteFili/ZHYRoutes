//
//  ViewController.m
//  ZHYRouteDemo
//
//  Created by 赵宏亚 on 2019/7/12.
//  Copyright © 2019 赵宏亚. All rights reserved.
//

#import "ViewController.h"
#import "BaseModel.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}




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










@end
