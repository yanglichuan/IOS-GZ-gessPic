//
//  ViewController.m
//  A01-传智猜图
//
//  Created by Apple on 14/12/14.
//  Copyright (c) 2014年 itcast. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

//strong  oc对象
//weak  UI控件 ，代理对象
//assign  基本类型  数值类型 BOOL 结构体  枚举
//copy 字符串


@property (weak, nonatomic) IBOutlet UILabel *countView;
@property (weak, nonatomic) IBOutlet UIButton *coinView;
@property (weak, nonatomic) IBOutlet UILabel *titleView;
@property (weak, nonatomic) IBOutlet UIButton *iconView;

//记录图片按钮的原始位置
@property (nonatomic, assign) CGRect oldFrame;

//遮盖的按钮
@property (nonatomic, weak) UIButton *coverView;

- (IBAction)tipClick;
- (IBAction)helpClick;
- (IBAction)bigImageClick;
- (IBAction)nextClick;

- (IBAction)iconClick;

@end

@implementation ViewController

//隐藏状态栏
- (BOOL)prefersStatusBarHidden
{
    return YES;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
//    NSLog(@"%@",NSHomeDirectory());


}

//- (void)viewDidAppear:(BOOL)animated
//{
//    [super viewDidAppear:animated];
//    self.iconView.imageView.image = [UIImage imageNamed:@"people-mj"];
//}


- (IBAction)tipClick {
}

- (IBAction)helpClick {
}

//1 点击放大图片
- (IBAction)bigImageClick {

    //记录原始的frame
    self.oldFrame = self.iconView.frame;
    
    //1.1  放大图片
    CGFloat iconW = self.view.frame.size.width;
    CGFloat iconH = iconW;
    CGFloat iconX = 0;
    CGFloat iconY = (self.view.frame.size.height - iconH) / 2;
    
    //1.3 生成遮盖的view （按钮）
    UIButton *coverView = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.view addSubview:coverView];
    
    self.coverView = coverView;
    
    coverView.frame = self.view.bounds;
    
    coverView.backgroundColor = [UIColor blackColor];
    coverView.alpha = 0;
    
    //1.4 把一个子控件置于顶层
    [self.view bringSubviewToFront:self.iconView];
    
    //1.2 动画
    [UIView animateWithDuration:1.0 animations:^{
        self.iconView.frame = CGRectMake(iconX, iconY, iconW, iconH);
        coverView.alpha = 0.5;
    }];
    
    //1.5 点击遮盖层 缩小图片
    [coverView addTarget:self action:@selector(smallImageClick) forControlEvents:UIControlEventTouchUpInside];
}

//1.5 点击遮盖层 缩小图片
- (void)smallImageClick
{
    [UIView animateWithDuration:1.0 animations:^{
        self.iconView.frame = self.oldFrame;
        self.coverView.alpha = 0;
        
    } completion:^(BOOL finished) {
        //当动画完成之后，移除遮盖按钮
        [self.coverView removeFromSuperview];

    }];
}
//1.6 点击图片按钮。放大或缩小
- (IBAction)iconClick {
    if (self.coverView == nil) {
        [self bigImageClick];
    }else{
        [self smallImageClick];
    }
}


- (IBAction)nextClick {
    
}

@end
