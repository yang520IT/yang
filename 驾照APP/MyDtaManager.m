//
//  MyDtaManager.m
//  驾照APP
//
//  Created by 刘烊 on 16/6/5.
//  Copyright © 2016年 阳光. All rights reserved.
//

#import "MyDtaManager.h"
#import "FMDatabase.h"
#import "TestSelectModel.h"
#import "AnswerModel.h"
@implementation MyDtaManager

+(NSArray *)getData:(DataType)type
{
    static FMDatabase *dataBase;
    NSMutableArray *array=[[NSMutableArray alloc]init];
    if(dataBase==nil){
        NSString *path=[[NSBundle mainBundle]pathForResource:@"data" ofType:@"sqlite"];
        dataBase=[[FMDatabase alloc]initWithPath:path];
    }
    if([dataBase open]){
        NSLog(@"open sucess");
    }else{
        return array;
    }
    switch (type) {
        case chapter:
        {
            //执行查询数据
            NSString *sql=@"select pid,pname,pcount FROM firstlevel";
            FMResultSet *rs=[dataBase executeQuery:sql];
            // 遍历结果集
            while ([rs next]) {
                TestSelectModel *model=[[TestSelectModel alloc]init];
                model.pid=[NSString stringWithFormat:@"%d",[rs intForColumn:@"pid"]];
                model.pname=[rs stringForColumn:@"pname"];
                model.pcount=[NSString stringWithFormat:@"%d",[rs intForColumn:@"pcount"]];
                [array addObject:model];
            }
        }
            break;
        case answer:
        {
            //执行查询数据
            NSString *sql=@"select mquestion,mdesc,mid,manswer,mimage,pid,pname,sid,sname,mtype FROM leaflevel";
            FMResultSet *rs=[dataBase executeQuery:sql];
            // 遍历结果集
            while ([rs next]) {
                AnswerModel *model=[[AnswerModel alloc]init];
                model.mquestion=[rs stringForColumn:@"mquestion"];
                model.mdesc=[rs stringForColumn:@"mdesc"];
                model.mid=[NSString stringWithFormat:@"%d",[rs intForColumn:@"mid"]];
                model.manswer=[rs stringForColumn:@"manswer"];
                model.mimage=[rs stringForColumn:@"mimage"];
                model.pid=[NSString stringWithFormat:@"%d",[rs intForColumn:@"pid"]];
                model.pname=[rs stringForColumn:@"pname"];
                model.sid=[NSString stringWithFormat:@"%d",[rs intForColumn:@"sid"]];
                model.sname=[rs stringForColumn:@"sname"];
                model.mtype=[NSString stringWithFormat:@"%d",[rs intForColumn:@"mtype"]];
             
                [array addObject:model];
            }
        }
             break;
        default:
            break;
    }
    return array;
}
@end
