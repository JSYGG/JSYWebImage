//
//  UIImageView+webImage.h
//  异步下载图片
//
//  Created by JSY on 16/7/31.
//  Copyright © 2016年 itheima. All rights reserved.
//

#import <UIKit/UIKit.h>
const 
@interface UIImageView (webImage)

@property(nonatomic,copy) NSString *URLstr;

-(void)jsy_setImageWithURLstr:(NSString *)URLstr;

@end
