//
//  MyDtaManager.h
//  驾照APP
//
//  Created by 刘烊 on 16/6/5.
//  Copyright © 2016年 阳光. All rights reserved.
//

#import <Foundation/Foundation.h>
typedef enum {
    chapter, //章节练习数据
    answer//答题数据
    
}DataType;
@interface MyDtaManager : NSObject

+(NSArray *)getData:(DataType)type;
@end
