//
//  UIImageView+webImage.m
//  异步下载图片
//
//  Created by JSY on 16/7/31.
//  Copyright © 2016年 itheima. All rights reserved.
//

#import "UIImageView+webImage.h"
#import "JSYWebImageManeger.h"

@implementation UIImageView (webImage)
-(void)jsy_setImageWithURLstr:(NSString *)URLstr
{
    JSYWebImageManeger *maneger = [JSYWebImageManeger shareWebImageManeger];
    [maneger downloadImageWithURLSring:URLstr complish:^(UIImage *image) {
        self.image = image;
    }];
}
@end
