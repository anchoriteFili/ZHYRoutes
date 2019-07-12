//
//  UIViewController+JumpRoute.h
//  ZHYRouteDemo
//
//  Created by 赵宏亚 on 2019/7/12.
//  Copyright © 2019 赵宏亚. All rights reserved.
//

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
