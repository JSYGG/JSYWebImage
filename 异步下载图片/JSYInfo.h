//
//  JSYInfo.h
//  异步下载图片
//
//  Created by JSY on 16/7/29.
//  Copyright © 2016年 itheima. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface JSYInfo : NSObject

@property(nonatomic,copy) NSString *name;

@property(nonatomic,copy) NSString *icon;

@property(nonatomic,copy) NSString *download;

@property(nonatomic,strong) UIImage *image;

@end
