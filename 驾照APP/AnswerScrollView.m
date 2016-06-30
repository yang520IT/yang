//
//  AnswerScrollView.m
//  驾照APP
//
//  Created by 刘烊 on 16/6/5.
//  Copyright © 2016年 阳光. All rights reserved.
//

#import "AnswerScrollView.h"
#import "AnswerTableViewCell.h"
#import "AnswerModel.h"
#import "Tools.h"
#define SIZE self.frame.size

@interface AnswerScrollView()<UIScrollViewDelegate,UITableViewDataSource,UITableViewDelegate>{
    
}
@end

@implementation AnswerScrollView
{
    UIScrollView *_scrollView;
    UITableView *_leftTableView;
    UITableView *_mainTableView;
    UITableView *_rightTabelView;
    NSArray *_dataArray;
}

-(instancetype)initWithFrame:(CGRect)frame withDataArray:(NSArray *)array
{
    self=[super initWithFrame:frame];
    if(self){
        _currentPage=0;
        _dataArray=[[NSArray alloc]initWithArray:array];
        _scrollView=[[UIScrollView alloc]initWithFrame:frame];
        _scrollView.delegate=self;
        _leftTableView=[[UITableView alloc]initWithFrame:frame style:UITableViewStyleGrouped];
        _mainTableView=[[UITableView alloc]initWithFrame:frame style:UITableViewStyleGrouped];
        _rightTabelView=[[UITableView alloc]initWithFrame:frame style:UITableViewStyleGrouped];
        _leftTableView.dataSource=self;
        _mainTableView.dataSource=self;
        _rightTabelView.dataSource=self;
        _leftTableView.delegate=self;
        _mainTableView.delegate=self;
        _rightTabelView.delegate=self;
        _scrollView.bounces=NO;
        _scrollView.showsHorizontalScrollIndicator=NO;//取消下面滑线
        _scrollView.showsVerticalScrollIndicator=NO;
        if (_dataArray.count>1){
            _scrollView.contentSize=CGSizeMake(SIZE.width*2, 0);
            
        }
        [self creatView];
    }
    return self;
}

-(void)creatView{
    _leftTableView.frame=CGRectMake(0, 0, SIZE.width, SIZE.height);
    _mainTableView.frame=CGRectMake(SIZE.width, 0, SIZE.width, SIZE.height);
    _rightTabelView.frame=CGRectMake(SIZE.width*2, 0, SIZE.width, SIZE.height);
    
    [_scrollView addSubview:_leftTableView];
    [_scrollView addSubview:_mainTableView];
    [_scrollView addSubview:_rightTabelView];
    [self addSubview:_scrollView];
}

#pragma mark - tableView dategate
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 4;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 100;
}

-(UIView*)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView *view=[[UIView alloc]initWithFrame:CGRectMake(0, 0, SIZE.width, 100)];
    view.backgroundColor=[UIColor redColor];
    return view;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellID = @"AnswerTableViewCell";
    AnswerTableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:cellID];
    if(cell==nil){
        cell=[[[NSBundle mainBundle]loadNibNamed:@"AnswerTableViewCell" owner:self options:nil]lastObject];
        cell.numberLabel.layer.masksToBounds=YES;
        cell.numberLabel.layer.cornerRadius=10;
    }
    cell.numberLabel.text=[NSString stringWithFormat:@"%c",(char)('A'+indexPath.row)];
   
    AnswerModel *model=[self getTheFitModel:tableView];
    //填充数据
    if ([model.mtype intValue]==1){
        cell.answerLabel.text=[[Tools getAnswerWithString:model.mquestion]objectAtIndex:indexPath.row];
    }
    return cell;
}

-(AnswerModel *)getTheFitModel:(UITableView *)tableView{
    
     AnswerModel *model;
    if (tableView==_leftTableView&&_currentPage==0){
        model=_dataArray[_currentPage];
    }else if(tableView==_leftTableView&&_currentPage>0){
        model=_dataArray[_currentPage-1];//加载前一个
    }else if(tableView==_mainTableView&&_currentPage==0){
        model=_dataArray[_currentPage+1];
    }else if(tableView==_mainTableView&&_currentPage>0&&_currentPage<_dataArray.count-1){
        model=_dataArray[_currentPage];
    }else if(tableView==_mainTableView&&_currentPage==_dataArray.count-1){
        model=_dataArray[_currentPage-1];
    }else if(tableView==_rightTabelView&&_currentPage==_dataArray.count-1){
        model=_dataArray[_currentPage];
    }else if(tableView==_rightTabelView&&_currentPage==_dataArray.count-1){
        model=_dataArray[_currentPage+1];
    }
    return model;

}

-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    CGPoint currenOffset=scrollView.contentOffset;
    int page=(int)currenOffset.x/SIZE.width;
    if (page<_dataArray.count-1&&page>0){
        _scrollView.contentSize=CGSizeMake(currenOffset.x+SIZE.width*2, 0);
        _mainTableView.frame=CGRectMake(currenOffset.x, 0, SIZE.width, SIZE.height);
        _leftTableView.frame=CGRectMake(currenOffset.x-SIZE.width, 0, SIZE.width, SIZE.height);
        _rightTabelView.frame=CGRectMake(currenOffset.x+SIZE.width, 0, SIZE.width, SIZE.height);
    }
    _currentPage=page;
    [self reloadData];
}

//每次滑动都是变换数据的
-(void)reloadData{
    [_leftTableView reloadData];//刷新数据
}

@end
