//
//  ViewController.m
//  constAndStaticAndextern
//
//  Created by 泛在吕俊衡 on 2017/5/25.
//  Copyright © 2017年 anjohnlv. All rights reserved.
//

#import "ViewController.h"

NSString * const name=@"DeerLu";//代替宏
static NSString * const text=@"1111";

@interface ViewController ()
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    //    name=@"3333";
    int a=2;
    [self test:&a];
}

//a不可以改变
-(void) test:(int const *) a {
    //    *a=3;
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    // 只分配一次内存
    static int number=0;
    number++;
    NSLog(@"%i",number);
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
