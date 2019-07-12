//
//  BaseWebViewController.h
//  ZHYRouteDemo
//
//  Created by 赵宏亚 on 2019/7/12.
//  Copyright © 2019 赵宏亚. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface BaseWebViewController : UIViewController


@property (nonatomic,strong) BaseModel *model;
@property (nonatomic,copy) NSString *linkUrl;

@end

NS_ASSUME_NONNULL_END
