//
//  ViewController.m
//  B06-KVC
//
//  Created by Apple on 14/12/14.
//  Copyright (c) 2014年 itcast. All rights reserved.
//

#import "ViewController.h"
#import "CZPerson.h"
#import "CZBook.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    CZPerson *p1 = [[CZPerson alloc] init];
    p1.name = @"德山";
    p1.age = 18;
    
    
    CZBook *book = [[CZBook alloc] init];
    book.name = @"金瓶梅";
    p1.book = book;
    
    
    CZPerson *p2 = [[CZPerson alloc] init];
    
    [p2 setValue:@"德刚" forKey:@"name"];
    [p2 setValue:@19 forKey:@"age"];
    
    CZPerson *p3 = [[CZPerson alloc] init];
    p3.name = @"房shi疼";
    p3.age = 20;
    
    
//    NSString *name = [p1 valueForKey:@"name"];
//    int age = [[p1 valueForKey:@"age"] intValue];
//    NSLog(@"%@",name);
    
    
//    NSDictionary *dic = [p1 dictionaryWithValuesForKeys:@[@"name",@"age"]];
//    NSLog(@"%@",dic);
    
    
//    NSArray *persons = @[p1,p2,p3];
//    
//    
//    NSArray *names = [persons valueForKey:@"name"];
//    NSLog(@"%@",names);
    
    
    
    
    //1
//    p1.book.name
    
    //2
    
//    [p1.book valueForKey:@"name"];
    
    //3
    
    [p1 valueForKeyPath:@"book.name"];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
