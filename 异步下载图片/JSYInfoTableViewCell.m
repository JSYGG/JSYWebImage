//
//  JSYInfoTableViewCell.m
//  异步下载图片
//
//  Created by JSY on 16/7/29.
//  Copyright © 2016年 itheima. All rights reserved.
//

#import "JSYInfoTableViewCell.h"
#import "JSYInfo.h"


@interface JSYInfoTableViewCell ()
@property (weak, nonatomic) IBOutlet UIImageView *iconView;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *downloadLabel;

@property(nonatomic,strong) NSOperationQueue *queue;

@end
@implementation JSYInfoTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    self.queue = [[NSOperationQueue alloc] init];
}
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.queue = [[NSOperationQueue alloc] init];
    }
    return self;
}


-(void)setInfo:(JSYInfo *)info
{
    _info = info;
    
    self.iconView.image = [UIImage imageNamed:@"bg_common"];
    self.nameLabel.text = @"name";
    self.downloadLabel.text = @"下载量";
    if (info) {
    NSBlockOperation *op = [NSBlockOperation blockOperationWithBlock:^{
        NSURL *iconURL = [NSURL URLWithString:info.icon];
        NSData *iconData = [NSData dataWithContentsOfURL:iconURL];
        UIImage *iconImage = [UIImage imageWithData:iconData];
        [[NSOperationQueue mainQueue] addOperationWithBlock:^{
            self.iconView.image = iconImage;
            self.nameLabel.text = info.name;
            self.downloadLabel.text = [NSString stringWithFormat:@"下载量:%@", info.download];
        }];
    }];
    
    [self.queue addOperation:op];
    }
}

@end
