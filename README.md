### const作用:

* 1.修饰右边指针变量和基础变量
* 2.被修饰的变量不可变

const使用场景：

* 修饰全局变量--->全局只读变量--->代替宏
* 修饰方法中的参数

const注意：

* int *const p:  p只读 *p读写
* int const *p1: p1读写 *p1只读
* int const *const p2:  p2只读 *p2只读
* const int *const p3:  p3只读 *p3只读

例子：

```
#import "ViewController.h"

NSString * const name=@"DeerLu";//代替宏
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
```
const与宏区别

| const   |   宏   |
|-------  |-------|
|编译      |   预编译  |
|有编译检查| 无编译检查|
|  不可以      | 可以定义函数方法|
|         |导致预编译时间较长|

### static的作用：

* 1、修饰局部变量，
	* 1.延长生命周期，而且和整个应用程序有关 
	* 2.只会分配一次内存
	* 3.为什么只分配一次内存？
* 2、修饰全局变量，限制作用域，只能在在当前文件使用

例子

```
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    // 只分配一次内存
    static int number=0;
    number++;
    NSLog(@"%i",number);
}
```
### extern的作用：

* 只能用来声明外部全局变量，不能定义

```
extern NSString *name;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    NSLog(@"name:%@",name);
    return YES;
}

2017-05-25 14:32:40.034 constAndStaticAndextern[3025:1138607] name:DeerLu
```
### static 和 const 联合使用

可以将全局变量限制在本文件使用，如：

```
#import "ViewController.h"

NSString * const name=@"DeerLu";//代替宏
static NSString * const text=@"1111";

@interface ViewController ()
@end
******************************************
@implementation AppDelegate

extern NSString *name;
extern NSString *text;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    NSLog(@"name:%@",name);
    NSLog(@"name:%@",text);//找不到_text,报错
    return YES;
}
```

### extern和const联合使用

当const修饰全局变量时，可能存在重复命名的情况。所以全局变量不能动易在自己的类中，必须建立项目全局变量。

例子，如果要使用全局变量，只需导入#import "GlobalConst.h"即可

```
#import <Foundation/Foundation.h>

extern NSString * const name;
extern NSString * const day;

**************************************
#import "GlobalConst.h"

NSString * const name;
NSString * const day;
```

[案例：Demo](https://github.com/CuitDeerLu/constAndStaticAndextern)
