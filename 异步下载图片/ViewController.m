//
//  ViewController.m
//  异步下载图片
//
//  Created by JSY on 16/7/29.
//  Copyright © 2016年 itheima. All rights reserved.
//

#import "ViewController.h"
#import "AFNetworking.h"
#import "JSYInfo.h"
#import "UIImageView+WebCache.h"
#import "JSYInfoTableViewCell.h"
@interface ViewController ()
@property(nonatomic,strong) NSMutableArray *infoArr;

@property(nonatomic,strong) NSOperationQueue *queue;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self loadData];
//    [self.tableView registerClass:[JSYInfoTableViewCell class] forCellReuseIdentifier:@"cell"];
}
/**
 *  加载数据 (AFN)
 */
-(void)loadData{
    NSString *urlString = @"https://raw.githubusercontent.com/JSYGG/JSYBigBang/master/apps.json";
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    //    __weak ViewController *weakself = self;
    [manager GET:urlString parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSArray *arr =responseObject;
        for (NSDictionary *dict in arr) {
            JSYInfo *info = [[JSYInfo alloc] init];
            [info setValuesForKeysWithDictionary:dict];
            [self.infoArr addObject:info];
        }
        [self.tableView reloadData];
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"error");
    }];
    
}
#pragma mark -- 数据源方法
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.infoArr.count != 0 ? self.infoArr.count : 50;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    JSYInfoTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    JSYInfo *info = self.infoArr.count != 0 ? self.infoArr[indexPath.row] : nil;;
    cell.info = info;
//    if (info.image != nil) {
//        cell.imageView.image = info.image;
//        return cell;
//    }
//    
//    NSURL *imageUrl =[NSURL URLWithString:info.icon];
//    
//    [cell.imageView sd_setImageWithURL:imageUrl];
//    NSBlockOperation *op = [NSBlockOperation blockOperationWithBlock:^{
//        
//        [NSThread sleepForTimeInterval:5];
//        NSURL *imageURL = [NSURL URLWithString:info.icon];
//        NSData *data = [NSData dataWithContentsOfURL:imageURL];
//        UIImage *iconImage = [UIImage imageWithData:data];
//        [[NSOperationQueue mainQueue] addOperationWithBlock:^{
////            cell.imageView.image = iconImage;
//            info.image =iconImage;
//            [self.tableView reloadRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationNone];
//        }];
//    }];
//    
//    [self.queue addOperation:op];    
    return cell;
}
/**
 *  懒加载
 */
-(NSOperationQueue *)queue
{
    if (_queue == nil) {
        _queue = [[NSOperationQueue alloc] init];
    }
    return _queue;
}
-(NSArray *)infoArr
{
    if (_infoArr == nil) {
        _infoArr  = [NSMutableArray array];
    }
    return _infoArr;
}



@end
