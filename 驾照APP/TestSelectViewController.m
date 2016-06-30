//
//  TestSelectViewController.m
//  驾照APP
//
//  Created by 刘烊 on 16/6/5.
//  Copyright © 2016年 阳光. All rights reserved.
//

#import "TestSelectViewController.h"
#import "TestSelectTableViewCell.h"
#import "TestSelectModel.h"
#import "AnsmerViewController.h"
@interface TestSelectViewController ()<UITableViewDataSource,UITableViewDelegate>
{
    UITableView *_tabelView;
}
@end

@implementation TestSelectViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor=[UIColor whiteColor];
    self.edgesForExtendedLayout=UIRectEdgeNone;
    [self cretTabelView];
    // Do any additional setup after loading the view.
}

-(void)cretTabelView{
    _tabelView=[[UITableView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height-64) style:UITableViewStylePlain];
    _tabelView.dataSource=self;
    _tabelView.delegate=self;
    [self.view addSubview:_tabelView];
    
}

#pragma mark - tabelview dategate
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _dataArray.count;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 80;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellId=@"TestSelectTableViewCell";
    TestSelectTableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:cellId];
    if(cell==nil){
        cell=[[[NSBundle mainBundle]loadNibNamed:cellId owner:self options:nil]lastObject];
        cell.selectionStyle=UITableViewCellSelectionStyleNone;
        cell.numberLabel.layer.masksToBounds=YES;
        cell.numberLabel.layer.cornerRadius=8;
    
    }
    TestSelectModel *model=_dataArray[indexPath.row];
    cell.numberLabel.text=model.pid;
    cell.titleLabel.text=model.pname;
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    AnsmerViewController *avc=[[AnsmerViewController alloc]init];
    avc.number=indexPath.row;
    [self.navigationController pushViewController:[[AnsmerViewController alloc]init] animated:YES];
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
