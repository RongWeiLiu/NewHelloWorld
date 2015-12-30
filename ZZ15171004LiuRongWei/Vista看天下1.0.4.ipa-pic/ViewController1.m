//
//  ViewController1.m
//  ZZ15171004LiuRongWei
//
//  Created by qianfeng on 15/12/12.
//  Copyright © 2015年 刘镕玮. All rights reserved.
//

#import "ViewController1.h"
#import <AFNetworking/AFNetworking.h>
#import <UIImageView+WebCache.h>
#import "Model1.h"
#import "TableViewCell1.h"
#import <MJRefresh/MJRefresh.h>
@interface ViewController1 ()<UITableViewDataSource,UITableViewDelegate>
{
    UITableView *_tableView;
    NSMutableArray *_dataArray;
    Model1 *_model;
}
@end

@implementation ViewController1

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"资讯";
    _dataArray = [[NSMutableArray alloc]init];
    [self createButton];
    [self createTableView];
    // Do any additional setup after loading the view.
}
-(void)createButton{
    UIImage *image1 = [[UIImage imageNamed:@"设置_2"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    UIBarButtonItem *button1 = [[UIBarButtonItem alloc] initWithImage:image1 style:UIBarButtonItemStylePlain target:self action:@selector(right)];
    self.navigationItem.rightBarButtonItem = button1;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)right{
    
}
-(void)createTableView{
    _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height-64)];
    UINib *nib = [UINib nibWithNibName:@"TableViewCell1" bundle:nil];
    [_tableView registerNib:nib forCellReuseIdentifier:@"cellIndetifier"];
    _tableView.dataSource = self;
    _tableView.delegate = self;
    [self.view addSubview: _tableView];
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    //    NSLog(@"%ld",_dataSource.count);
    return _dataArray.count;
    
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    //    static NSString *indentifier = @"cellIndetifier";
    listModel *model = _dataArray[indexPath.row];
    
    TableViewCell1 *cell = [tableView dequeueReusableCellWithIdentifier:@"cellIndetifier"];
    [cell upDataWith:model];
    NSLog(@"%@",_dataArray);
    return cell;
}
-(void)LoadDataFromNet{

    NSString *url = [NSString stringWithFormat:@"http://ktx.cms.palmtrends.com/api_v2.php?action=home_list&sa=&uid=10067566&mobile=iphone5&offset=0&count=15&&e=b7849d41b00bbacc9a62544402abed9e&uid=10067566&pid=10053&mobile=iphone5&platform=i"];
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    [manager GET:url parameters:nil progress:^(NSProgress * _Nonnull downloadProgress) {
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
    }];

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
