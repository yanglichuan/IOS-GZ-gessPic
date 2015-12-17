//
//  CZQuestion.m
//  A01-传智猜图
//
//  Created by Apple on 14/12/14.
//  Copyright (c) 2014年 itcast. All rights reserved.
//

#import "CZQuestion.h"

@implementation CZQuestion
- (instancetype)initWithDic:(NSDictionary *)dic
{
    if (self = [super init]) {
//        self.answer = dic[@"answer"];
//        self.title = dic[@"title"];
//        self.icon = dic[@"icon"];
//        self.options = dic[@"options"];
        
        //kvc   key value coding
//        [self setValue:dic[@"answer"] forKeyPath:@"answer"];
//        [self setValue:dic[@"title"] forKeyPath:@"title"];
        
        
        //把字典中对应的键的值，取出赋给对象对应的属性 （对象的属性，必须和字典的键一样）
        [self setValuesForKeysWithDictionary:dic];
    }
    return self;
}


+ (instancetype)questionWithDic:(NSDictionary *)dic
{
    return [[self alloc] initWithDic:dic];
}

+ (NSArray *)questionsList
{
    //加载plist
    NSString *path = [[NSBundle mainBundle] pathForResource:@"questions" ofType:@"plist"];
    NSArray *dicArray = [NSArray arrayWithContentsOfFile:path];
    
    //字典转模型
    NSMutableArray *tmpArray = [NSMutableArray array];
    for (NSDictionary *dic in dicArray) {
        CZQuestion *question = [CZQuestion questionWithDic:dic];
        [tmpArray addObject:question];
    }
    return tmpArray;
}
@end
