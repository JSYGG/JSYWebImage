//
//  JSYInfoTableViewCell.m
//  异步下载图片
//
//  Created by JSY on 16/7/29.
//  Copyright © 2016年 itheima. All rights reserved.
//

#import "JSYInfoTableViewCell.h"
#import "JSYInfo.h"
#import "UIImageView+WebCache.h"


@interface JSYInfoTableViewCell ()

@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *downloadLabel;



@end
@implementation JSYInfoTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    
}
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
    }
    return self;
}
/**
 *  模型属性set方法
 */
-(void)setInfo:(JSYInfo *)info
{
    _info = info;
    self.nameLabel.text = info.name;
    self.downloadLabel.text = [NSString stringWithFormat:@"下载量:%@", info.download];
}



@end
