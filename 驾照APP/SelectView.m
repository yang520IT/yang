//
//  SelectView.m
//  驾照APP
//
//  Created by 刘烊 on 16/6/4.
//  Copyright © 2016年 阳光. All rights reserved.
//

#import "SelectView.h"

@implementation SelectView
{
    UIButton *_button;
}

-(instancetype)initWithFrame:(CGRect)frame andBtn:(UIButton *)btn
{
    self=[super initWithFrame:frame];
    if (self){
        //逻辑操作
        self.backgroundColor=[UIColor colorWithRed:0 green:0 blue:0 alpha:0.7];
        _button=btn;
        [self creatBtn];
    }
    return self;
}

-(void)creatBtn{
    for (int i=0;i<4;i++){
        UIButton *btn=[UIButton buttonWithType:UIButtonTypeSystem];
        btn.frame=CGRectMake(self.frame.size.width/4*i+self.frame.size.width/4/2-30, self.frame.size.height-80, 60, 60);
        [btn setBackgroundImage:[UIImage imageNamed:[NSString stringWithFormat:@"%d.png",i+1]] forState:UIControlStateNormal];
        [btn addTarget:self action:@selector(click:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:btn];
    }
}

-(void)click:(UIButton *)btn{
    [_button setImage:[btn backgroundImageForState:UIControlStateNormal] forState:UIControlStateNormal];
    [UIView animateWithDuration:0.3 animations:^{
        self.alpha=0;
    }];

}
@end
