//
//  Tools.m
//  驾照APP
//
//  Created by 刘烊 on 16/6/5.
//  Copyright © 2016年 阳光. All rights reserved.
//

#import "Tools.h"

@implementation Tools

+(NSArray *)getAnswerWithString:(NSString *)str
{
    NSMutableArray *array=[[NSMutableArray alloc]init];
    NSArray *arr=[str componentsSeparatedByString:@"<BR>"];
    [array addObject:arr[0]];
    for (int i=0;i<4;i++){
        [array addObject:[arr[i+1] substringFromIndex:2]];
    }
    return array;
}

+(CGSize)getAnswerWithString:(NSString *)str with:(UIFont *)font withSize:(CGSize)size
{
    CGSize newSize = [str sizeWithFont:font constrainedToSize:size];
    return newSize;
}
@end
