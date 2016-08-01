//
//  UIImageView+webImage.m
//  异步下载图片
//
//  Created by JSY on 16/7/31.
//  Copyright © 2016年 itheima. All rights reserved.
//

#import "UIImageView+webImage.h"
#import "JSYWebImageManeger.h"
#import <objc/runtime.h>

const char *kURLstr = "kURLstr";
@implementation UIImageView (webImage)
-(void)jsy_setImageWithURLstr:(NSString *)URLstr
{
    if (self.URLstr != nil && ![self.URLstr isEqualToString:URLstr]) {
        /**
         *  取消下载操作
         */
        NSLog(@"取消下载");
        [[JSYWebImageManeger shareWebImageManeger] cancelOperationWithURLstr:self.URLstr];
    }
    /**
     *  设置展位图或者设空
     */
    self.image = nil;
    //记录
    self.URLstr = URLstr;
    JSYWebImageManeger *maneger = [JSYWebImageManeger shareWebImageManeger];
    [maneger downloadImageWithURLSring:self.URLstr complish:^(UIImage *image) {
        self.image = image;
        self.URLstr = nil;
    }];
}

-(NSString *)URLstr{
    return objc_getAssociatedObject(self, kURLstr);
}

-(void)setURLstr:(NSString *)URLstr
{
    objc_setAssociatedObject(self, kURLstr, URLstr, OBJC_ASSOCIATION_COPY_NONATOMIC);
}
@end
