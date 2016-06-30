//
//  Tools.h
//  驾照APP
//
//  Created by 刘烊 on 16/6/5.
//  Copyright © 2016年 阳光. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface Tools : NSObject

+(NSArray *)getAnswerWithString:(NSString *)str;

+(CGSize)getAnswerWithString:(NSString *)str with:(UIFont *)font withSize:(CGSize)size;

@end
