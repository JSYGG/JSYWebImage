//
//  JSYWebImageManeger.m
//  异步下载图片
//
//  Created by JSY on 16/7/30.
//  Copyright © 2016年 itheima. All rights reserved.
//

#import "JSYWebImageManeger.h"

@implementation JSYWebImageManeger

/**
 *  单例类方法
 */
+(instancetype)shareWebImageManeger{
    static JSYWebImageManeger *maneger;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        maneger = [[JSYWebImageManeger alloc] init];
    });
    return maneger;
}

@end
