//
//  JSYWebImageOperation.h
//  异步下载图片
//
//  Created by JSY on 16/7/31.
//  Copyright © 2016年 itheima. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface JSYWebImageOperation : NSOperation

@property(nonatomic,strong) UIImage *image;


+(instancetype)operationWithURLstr:(NSString *)URLstr;
@end
