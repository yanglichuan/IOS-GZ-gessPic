//
//  CZPerson.h
//  B06-KVC
//
//  Created by Apple on 14/12/14.
//  Copyright (c) 2014年 itcast. All rights reserved.
//

#import <Foundation/Foundation.h>


@class CZBook;

@interface CZPerson : NSObject
@property (nonatomic,copy) NSString *name;
@property (nonatomic,assign) int age;

@property (nonatomic,strong) CZBook *book;
@end
