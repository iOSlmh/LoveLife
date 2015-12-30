//
//  ARCDetailViewController.m
//  LoveLife
//
//  Created by qianfeng on 15/12/30.
//  Copyright © 2015年 yangyang. All rights reserved.
//

#import "ARCDetailViewController.h"

@interface ARCDetailViewController ()

@end

@implementation ARCDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setNav];
    [self createUI];
}
-(void)createUI{
    UIWebView * webView = [[UIWebView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_W, SCREEN_H)];
    [webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:[NSString stringWithFormat:ARTICALDETAILURL,self.model.dataID]]]];
    //让webView 适应屏幕大小
    webView.scalesPageToFit = YES;
    [self.view addSubview:webView];

}
-(void)setNav{
self.titleLabel.text = @"详情";
    [self.leftButton setImage:[UIImage imageNamed:@"iconfont-back"] forState:UIControlStateNormal];
    [self.rightButton setImage:[UIImage imageNamed:@"iconfont-fenxiang"] forState:UIControlStateNormal];
    [self setLeftButtonClick:@selector(leftClick)];
    [self setRightButtonClick:@selector(rightClick)];

}



#pragma mark---按钮响应
-(void)leftClick{

    [self.navigationController popViewControllerAnimated:YES];
}
//分享
-(void)rightClick{

    UIImage * image = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:self.model.pic]]];
    [UMSocialSnsService presentSnsIconSheetView:self appKey:APPKEY shareText:[NSString stringWithFormat:ARTICALDETAILURL,self.model.dataID] shareImage:image shareToSnsNames:@[UMShareToSina,UMShareToQzone,UMShareToQQ,UMShareToWechatTimeline,UMShareToWechatSession] delegate:nil];

}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
