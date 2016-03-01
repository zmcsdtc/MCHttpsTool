//
//  ViewController.m
//  MCHttpsTool
//
//  Created by ZMC on 16/3/1.
//  Copyright © 2016年 Zmc. All rights reserved.
//

#import "ViewController.h"
#import "MCHttpsTool.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
//    [self testNetWork];
    
    UIImageView*iv=[[UIImageView alloc]initWithFrame:CGRectMake(0, 20, 300, 200)];
    iv.backgroundColor=[UIColor yellowColor];
    [self.view addSubview:iv];
    [MCHttpsTool downLoadImage:@"http://i1.hoopchina.com.cn/u/1602/29/144/1144/b393b021jpg.jpg" placeholderImgae:[UIImage imageNamed:@"123.jpg"] toImageView:iv];
    
    
}
- (void) testNetWork{
    [MCHttpsTool postRequest:@"https://www.baidu.com" params:nil success:^(id responseObject) {
        NSLog(@"re=%@",responseObject);
    } failure:^(NSError *error) {
        NSLog(@"er=%@",error);
    } timeoutInt:2];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
