//
//  AnswerScrollView.h
//  驾照APP
//
//  Created by 刘烊 on 16/6/5.
//  Copyright © 2016年 阳光. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AnswerScrollView : UIView

-(instancetype)initWithFrame:(CGRect)frame withDataArray:(NSArray *)array;

@property(nonatomic,assign,readonly)int currentPage;//当前页数

@end
