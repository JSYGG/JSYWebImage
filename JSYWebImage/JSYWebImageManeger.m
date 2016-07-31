//
//  JSYWebImageManeger.m
//  异步下载图片
//
//  Created by JSY on 16/7/30.
//  Copyright © 2016年 itheima. All rights reserved.
//

#import "JSYWebImageManeger.h"
#import "JSYWebImageOperation.h"
#import "NSString+path.h"

@interface JSYWebImageManeger ()

@property(nonatomic,strong) NSOperationQueue *queue;

@property(nonatomic,strong) NSMutableDictionary *operationCashe;

@property(nonatomic,strong) NSMutableDictionary *imageCashe;



@end
@implementation JSYWebImageManeger
- (instancetype)init
{
    self = [super init];
    if (self) {
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(receiveMemoryWarning) name:UIApplicationDidReceiveMemoryWarningNotification object:nil];
    }
    return self;
}

-(void)downloadImageWithURLSring:(NSString *)URLstr complish:(void (^)(UIImage *image))complish{
    
    NSAssert(complish != nil, @"请回调block");
    /**
     *  内存缓存
     */
    UIImage *image = self.imageCashe[URLstr];
    if (image != nil) {
        NSLog(@"neicun");
        complish(image);
        return;
    }
    /**
     *  沙盒缓存
     */
    image = [UIImage imageWithContentsOfFile:[URLstr appendCachePath]];
    if (image != nil) {
        NSLog(@"shahe ");
        //保存到内存
        [self.imageCashe setObject:image forKey:URLstr];
        complish(image);
        return;
    }
    /**
     *  操作缓存
     */
    if (self.operationCashe[URLstr] != nil) {
        NSLog(@"youcaozuo ");
        return;
    }
    
    JSYWebImageOperation *op = [JSYWebImageOperation operationWithURLstr:URLstr];
    __weak typeof(op) weakop = op;
    [op setCompletionBlock:^{
        UIImage *image = weakop.image;
        [[NSOperationQueue mainQueue] addOperationWithBlock:^{
            //保存image到内存
            [self.imageCashe setObject:image forKey:URLstr];
            [self downloadImageWithURLSring:URLstr complish:complish];
        }];
    }];
    //保存操作到内存
    [self.operationCashe setObject:op forKey:URLstr];
    [self.queue addOperation:op];
}


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

-(NSOperationQueue *)queue{
    if (_queue == nil) {
        _queue = [[NSOperationQueue alloc] init];
    }
    return _queue;
}
-(NSMutableDictionary *)imageCashe
{
    if (_imageCashe == nil) {
        _imageCashe = [[NSMutableDictionary alloc] init];
    }
    return _imageCashe;
}
-(NSMutableDictionary *)operationCashe{
    if (_operationCashe == nil) {
        _operationCashe = [[ NSMutableDictionary alloc] init];
    }
    return _operationCashe;
}
/**
 *  释放
 */
-(void)receiveMemoryWarning{
    [self.imageCashe removeAllObjects];
    [self.operationCashe removeAllObjects];
    [self.queue cancelAllOperations];
}
@end
