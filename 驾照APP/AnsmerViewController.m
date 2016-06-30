//
//  AnsmerViewController.m
//  驾照APP
//
//  Created by 刘烊 on 16/6/5.
//  Copyright © 2016年 阳光. All rights reserved.
//

#import "AnsmerViewController.h"
#import "AnswerScrollView.h"
#import "MyDtaManager.h"
#import "AnswerModel.h"
@interface AnsmerViewController ()

@end

@implementation AnsmerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.edgesForExtendedLayout=UIRectEdgeNone;
    self.view.backgroundColor=[UIColor whiteColor];
    NSMutableArray *arr=[[NSMutableArray alloc]init];
    NSArray *array=[MyDtaManager getData:answer];
    for (int i=0;i<array.count-1;i++){
        AnswerModel *model=array[i];
        if([model.pid intValue]==_number+1){
            [arr addObject:model];
        }
    }
    AnswerScrollView *view=[[AnswerScrollView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height-64)withDataArray:arr];
    [self.view addSubview:view];
    // Do any additional setup after loading the view.
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
