//
//  JSYWebImageManeger.h
//  异步下载图片
//
//  Created by JSY on 16/7/30.
//  Copyright © 2016年 itheima. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface JSYWebImageManeger : NSObject

+(instancetype)shareWebImageManeger;


-(void)downloadImageWithURLSring:(NSString *)URLstr complish:(void (^)(UIImage *image)) complish;
@end
