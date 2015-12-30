//
//  ReadViewController.m
//  LoveLife
//
//  Created by 杨阳 on 15/12/29.
//  Copyright © 2015年 yangyang. All rights reserved.
//

#import "ReadViewController.h"
#import "RecondViewController.h"
#import "ArcViewController.h"

@interface ReadViewController ()<UIScrollViewDelegate>
{
    UIScrollView * _scrollView;
    UISegmentedControl * _segmentControl;

}
@end

@implementation ReadViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setNav];
    [self createUI];
}

-(void)createUI{

    _scrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_W, SCREEN_H)];
    _scrollView.delegate = self;
    _scrollView.pagingEnabled = YES;
    _scrollView.bounces = NO;
    _scrollView.showsHorizontalScrollIndicator = NO;
    _scrollView.showsVerticalScrollIndicator = NO;
    [self.view addSubview:_scrollView];
    //下面改为0  注意注意   与刷新冲突
    _scrollView.contentSize = CGSizeMake(SCREEN_W * 2, 0);
    //实例化子控制器
    ArcViewController * arcVC = [[ArcViewController alloc]init];
    RecondViewController * recondVC = [[RecondViewController alloc]init];
    
    NSArray * VCArray = @[arcVC,recondVC];
    //滚动式的框架实现
    int i= 0;
    for (UIViewController * vc in VCArray) {
        
        vc.view.frame = CGRectMake(i* SCREEN_W, 0, SCREEN_W, SCREEN_H);
        [self addChildViewController:vc];
        [_scrollView addSubview:vc.view];
        i++ ;
    }
    

}

-(void)setNav{
     //创建segment
    _segmentControl = [[UISegmentedControl alloc]initWithFrame:CGRectMake(0, 0, 100, 30)];
    //插入标题
    [_segmentControl insertSegmentWithTitle:@"读美文" atIndex:0 animated:YES];
    [_segmentControl insertSegmentWithTitle:@"看语录" atIndex:1 animated:YES];
    //字体颜色
    _segmentControl.tintColor = [UIColor whiteColor];
    //设置默认选中读美文
    _segmentControl.selectedSegmentIndex = 0;
    [_segmentControl addTarget:self action:@selector(changeOption:) forControlEvents:UIControlEventTouchUpInside];
    
    self.navigationItem.titleView = _segmentControl;

}
//响应方法
-(void)changeOption:(UISegmentedControl *)segment{

    
    _scrollView.contentOffset = CGPointMake(segment.selectedSegmentIndex * SCREEN_W, 0);
    
//    if (segment.selectedSegmentIndex == 1) {
//        _scrollView.contentOffset = CGPointMake(SCREEN_W, 0);
//        
//    }else{
//    
//        _scrollView.contentOffset = CGPointMake(0, 0);
//    }
}
-(void)scrollViewDidScroll:(UIScrollView *)scrollView{

    _segmentControl.selectedSegmentIndex = _scrollView.contentOffset.x/SCREEN_W;

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
