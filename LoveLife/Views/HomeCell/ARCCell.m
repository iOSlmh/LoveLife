//
//  ARCCell.m
//  LoveLife
//
//  Created by qianfeng on 15/12/30.
//  Copyright © 2015年 yangyang. All rights reserved.
//

#import "ARCCell.h"

@implementation ARCCell


-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self createUI];
    }
    return self;
}

-(void)createUI{
    _imageView = [FactoryUI createImageViewWithFrame:CGRectMake(10, 10, 120, 90) imageName:nil];
    [self.contentView addSubview:_imageView];
    
    _timelable = [FactoryUI createLabelWithFrame:CGRectMake(10, _imageView.frame.size.height + _imageView.frame.origin.y+10, 120, 20) text:nil textColor:[UIColor darkGrayColor] font:[UIFont systemFontOfSize:12]];
    [self.contentView addSubview:_timelable];
    
    _titlelable = [FactoryUI createLabelWithFrame:CGRectMake(_imageView.frame.origin.x + _imageView.frame.size.width+10, 30, 100, 40) text:nil textColor:[UIColor darkGrayColor] font:[UIFont systemFontOfSize:15]];
    _titlelable.numberOfLines = 0;
    _titlelable.lineBreakMode = NSLineBreakByWordWrapping;
    [self.contentView addSubview:_titlelable];
    
    _authorlable = [FactoryUI createLabelWithFrame:CGRectMake(SCREEN_W-120, _timelable.frame.origin.y, 110, 20) text:nil textColor:[UIColor blackColor] font:[UIFont systemFontOfSize:15]];
    [self.contentView addSubview:_authorlable];
}
-(void)refreshUI:(ReadModel *)model{
    _titlelable.text = model.title;
    _timelable.text = model.createtime;
    _authorlable.text = model.author;
    [_imageView sd_setImageWithURL:[NSURL URLWithString:model.pic] placeholderImage:nil];

}
- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
