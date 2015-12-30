//
//  ARCCell.h
//  LoveLife
//
//  Created by qianfeng on 15/12/30.
//  Copyright © 2015年 yangyang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ReadModel.h"
@interface ARCCell : UITableViewCell

{
    UIImageView * _imageView;
    UILabel * _timelable;
    UILabel * _authorlable;
    UILabel * _titlelable;
    

}

-(void)refreshUI:(ReadModel *)model;
@end
