//
//  ARCDetailViewController.h
//  LoveLife
//
//  Created by qianfeng on 15/12/30.
//  Copyright © 2015年 yangyang. All rights reserved.
//

#import "RootViewController.h"
#import "ReadModel.h"
@interface ARCDetailViewController : RootViewController
//用retain
@property (nonatomic,retain) ReadModel * model;
@end
