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
    [self testNetWork];
    
//    UIImageView*iv=[[UIImageView alloc]initWithFrame:CGRectMake(0, 20, 300, 200)];
//    iv.backgroundColor=[UIColor yellowColor];
//    [self.view addSubview:iv];
//    [MCHttpsTool downLoadImage:@"http://i1.hoopchina.com.cn/u/1602/29/144/1144/b393b021jpg.jpg" placeholderImgae:[UIImage imageNamed:@"123.jpg"] toImageView:iv];
    
    
}
- (void) testNetWork{
    [MCHttpsTool get:@"http://www.weather.com.cn/data/sk/101010100.html" params:nil success:^(id responseObj) {
#warning mark- 返回的结果是nsdata类型
        NSData *doubi = responseObj;
//        NSString *shabi =  [[NSString alloc]initWithData:doubi encoding:NSUTF8StringEncoding];
        NSDictionary*dic=[NSJSONSerialization JSONObjectWithData:doubi options:NSJSONReadingMutableContainers error:nil];
        NSLog(@"dic=%@",dic);
    } failure:^(NSError *error) {
        NSLog(@"er=%@",error);
    }];

}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
