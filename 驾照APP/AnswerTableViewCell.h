//
//  AnswerTableViewCell.h
//  驾照APP
//
//  Created by 刘烊 on 16/6/5.
//  Copyright © 2016年 阳光. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AnswerTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *numberLabel;
@property (weak, nonatomic) IBOutlet UIImageView *numberImage;
@property (weak, nonatomic) IBOutlet UILabel *answerLabel;

@end
