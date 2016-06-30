//
//  ViewController.m
//  驾照APP
//
//  Created by 刘烊 on 16/6/4.
//  Copyright © 2016年 阳光. All rights reserved.
//

#import "ViewController.h"
#import "SelectView.h"
#import "FirstViewController.h"
@interface ViewController ()
{
    SelectView *_selecView;
    __weak IBOutlet UIButton *selectBtn;
}
@end

@implementation ViewController
- (IBAction)click:(UIButton *)sender {
    
    switch (sender.tag) {
        case 100:
        {
            [UIView animateWithDuration:0.3 animations:^{
                _selecView.alpha=1;
            }];
            
        }
            break;
        case 101://科目一
        {
            [self.navigationController pushViewController:[[FirstViewController alloc]init] animated:YES];
        }
            break;
        case 102:
        {
            
        }
            break;
        case 103:
        {
            
        }
            break;
        case 104:
        {
            
        }
            break;
        case 105:
        {
            
        }
            break;
        case 106:
        {
            
        }
            break;
        default:
            break;
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
   
    _selecView=[[SelectView alloc]initWithFrame:self.view.frame andBtn:selectBtn];
    _selecView.alpha=0;
    [self.view addSubview:_selecView];
    
    
    UIView *view=[[UIView alloc]initWithFrame:CGRectMake(0, 0, 400, 300)];
    view.backgroundColor=[UIColor redColor]
    ;

    [self.view addSubview:view];
   
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
