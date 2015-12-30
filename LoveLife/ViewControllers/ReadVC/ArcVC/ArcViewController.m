//
//  ArcViewController.m
//  LoveLife
//
//  Created by qianfeng on 15/12/30.
//  Copyright © 2015年 yangyang. All rights reserved.
//

#import "ArcViewController.h"
#import "ReadModel.h"
#import "ARCCell.h"
#import "ARCDetailViewController.h"
@interface ArcViewController ()<UITableViewDataSource,UITableViewDelegate>
{

    UITableView * _tableView;
    int _page;
}
@property (nonatomic,strong) NSMutableArray * dataArray;
@end

@implementation ArcViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self createTableView];
    [self createRefresh];
   
}
-(void)createRefresh{

    _tableView.header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(myRefresh)];
    _tableView.footer = [MJRefreshAutoFooter footerWithRefreshingTarget:self refreshingAction:@selector(loadMore)];
    [_tableView.header beginRefreshing];
}

-(void)myRefresh{

    _page = 0;
    self.dataArray = [NSMutableArray arrayWithCapacity:0];
    [self loadData];
    
}
-(void)loadMore{

    _page++;
    [self loadData];
    
}

-(void)loadData{

    AFHTTPRequestOperationManager * manager = [AFHTTPRequestOperationManager manager];
    //手动设置格式，默认格式支持json
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"text/html", nil];
    [manager GET:[NSString stringWithFormat:ARTICALURL,_page] parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSArray * arr = responseObject[@"data"];
        for (NSDictionary * dic in arr) {
            ReadModel * model = [[ReadModel alloc]init];
            [model setValuesForKeysWithDictionary:dic];
            [_dataArray addObject:model];
        }
        //数据请求成功之后停止刷新，刷新界面
        if (_page == 0)
        {
            [_tableView.header endRefreshing];
        }
        else
        {
            [_tableView.footer endRefreshing];
        }
        
        [_tableView reloadData];

    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
    }];

}

-(void)createTableView{

    _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_W, SCREEN_H)];
    
    _tableView.delegate = self;
    _tableView.dataSource = self;
    [self.view addSubview:_tableView];
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{

    return self.dataArray.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    ARCCell * cell = [tableView dequeueReusableCellWithIdentifier:@"ARCcell"];
    if (!cell) {
        cell = [[ARCCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"ARCcell"];
        if (self.dataArray) {
            ReadModel * model = self.dataArray[indexPath.row];
            [cell refreshUI:model];
        }
    }

    return cell;

}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 200;

}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    ARCDetailViewController * vc = [[ARCDetailViewController alloc]init];
    ReadModel * model = self.dataArray[indexPath.row];
    vc.model = model;
    vc.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:vc animated:YES];
    

}

//给cell添加动画
-(void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath{

    cell.layer.transform = CATransform3DMakeScale(0, 0.1, 1);
    [UIView animateWithDuration:2 animations:^{
        cell.layer.transform = CATransform3DMakeScale(1, 1, 1);
    }];

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
