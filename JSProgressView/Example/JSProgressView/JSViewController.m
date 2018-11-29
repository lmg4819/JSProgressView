//
//  JSViewController.m
//  JSProgressView
//
//  Created by lmg4819 on 11/28/2018.
//  Copyright (c) 2018 lmg4819. All rights reserved.
//

#import "JSViewController.h"
#import <JSProgressView/JSProgressView.h>
#import <JSProgressView/JSProgressViewConfig.h>


@interface JSViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,strong) UITableView *tableView;
@property (nonatomic,strong) NSArray *dataList;

@end

@implementation JSViewController

- (void)agreeMethod:(UIButton *)sender
{
    [JSProgressView showHUD];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [JSProgressView dismiss];
    });
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.dataList = @[@"show",@"showImage",@"showStatus",@"showHUDWithStatus",@"showImageWithStatus",@"dismiss",@"showHUDWithDuration",@"showWithStatusDuration",@"showWithImageDuration",@"showHUDWithStatusDuration",@"showWithImageDuration"];
    [self.view addSubview:self.tableView];
    
    
}

#pragma mark -UITableViewDelegate,UITableViewDataSource
-(UITableView *)tableView
{
    if (!_tableView) {
        _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 44, self.view.bounds.size.width, self.view.bounds.size.height-44-34)];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.tableFooterView = [UIView new];
    }
    return _tableView;
}




-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.dataList.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    cell.textLabel.text = self.dataList[indexPath.row];
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 0) {
        JSProgressViewConfig *config = [JSProgressViewConfig defaultConfig];
        config.foregroundColor = [UIColor yellowColor];
        [JSProgressView setCustomConfig:config];
        [JSProgressView showHUD];
        [JSProgressView cleanCustomConfig];
    }else if (indexPath.row == 1){
        [JSProgressView showWithImage:[UIImage imageNamed:@"Checkmark"]];
    }else if (indexPath.row == 2){
        [JSProgressView showWithStatus:@"欢迎光临"];
    }else if (indexPath.row == 3){
        [JSProgressView showHUDWithStatus:@"欢迎光临"];
    }else if (indexPath.row == 4){
        [JSProgressView showWithImage:[UIImage imageNamed:@"Checkmark"] status:@"欢迎光临"];
    }else if(indexPath.row == 5){
        [JSProgressView dismiss];
    }else if (indexPath.row == 6){
        [JSProgressView showHUDWithDuration:2.0];
    }else if (indexPath.row == 7){
        [JSProgressView showWithStatus:@"欢迎光临" duration:2.0];
    }else if (indexPath.row == 8){
        [JSProgressView showWithImage:[UIImage imageNamed:@"Checkmark"] duration:2.0];
    }else if (indexPath.row == 9){
        [JSProgressView showHUDWithStatus:@"欢迎光临" duration:2.0];
    }else if (indexPath.row == 10){
        [JSProgressView showWithImage:[UIImage imageNamed:@"Checkmark"] status:@"欢迎光临" duration:2.0];
    }
}
@end
