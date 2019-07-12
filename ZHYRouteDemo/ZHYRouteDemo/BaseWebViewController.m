//
//  BaseWebViewController.m
//  ZHYRouteDemo
//
//  Created by 赵宏亚 on 2019/7/12.
//  Copyright © 2019 赵宏亚. All rights reserved.
//

#import "BaseWebViewController.h"

@interface BaseWebViewController ()

@property (weak, nonatomic) IBOutlet UILabel *label;


@end

@implementation BaseWebViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    if (self.linkUrl.length) {
        self.label.text = self.linkUrl;
    }
    
    if (self.model.title.length) {
        self.title = self.model.title;
    }
    
    
    
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
