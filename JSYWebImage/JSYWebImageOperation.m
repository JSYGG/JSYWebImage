//
//  JSYWebImageOperation.m
//  异步下载图片
//
//  Created by JSY on 16/7/31.
//  Copyright © 2016年 itheima. All rights reserved.
//

#import "JSYWebImageOperation.h"
#import "NSString+path.h"

@interface JSYWebImageOperation ()
@property(nonatomic,copy) NSString *URLstr;
@end

@implementation JSYWebImageOperation
+(instancetype)operationWithURLstr:(NSString *)URLstr  {
    JSYWebImageOperation *op  = [[JSYWebImageOperation alloc ] init];
    op.URLstr = URLstr;
    return op;
}

-(void)main {
    [NSThread sleepForTimeInterval:arc4random_uniform(10)];
    
    NSURL *url = [NSURL URLWithString:self.URLstr];
    
    NSData *data = [NSData dataWithContentsOfURL:url];
    
    UIImage *image = [UIImage imageWithData:data];
    
    /**
     *  写到沙盒
     */
    [data writeToFile:[self.URLstr appendCachePath] atomically:YES];
    
    self.image = image;
}
@end
