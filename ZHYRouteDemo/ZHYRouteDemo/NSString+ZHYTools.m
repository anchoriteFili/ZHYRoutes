//
//  NSString+ZHYTools.m
//  ZHYRouteDemo
//
//  Created by 赵宏亚 on 2019/7/12.
//  Copyright © 2019 赵宏亚. All rights reserved.
//

#import "NSString+ZHYTools.h"

@implementation NSString (ZHYTools)

- (BOOL)myContainsString:(NSString*)other{
    NSRange range = [self rangeOfString:other];
    return range.length != 0;
}

@end
