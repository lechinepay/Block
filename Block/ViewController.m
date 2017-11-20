//
//  ViewController.m
//  Block
//
//  Created by 马洪亮 on 2017/11/20.
//  Copyright © 2017 马洪亮. All rights reserved.
//

#import "ViewController.h"


@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    int (^myBlock)(int) = ^(int num) {

        return num * 100;

    };

    int total = myBlock(4);

    NSLog(@"------%d", total);


    void (^myBlockStr)(NSString *str) = ^(NSString *string) {

        NSLog(@"---------------%@", string);
    };


    myBlockStr(@"test");

    /*数组排序*/

    NSArray *stringArray = [NSArray arrayWithObjects:@"abc 1", @"abc 21", @"abc 12", @"abc 13", @"abc 05", nil];

    NSComparator sortBlock = ^(id string1, id string2) {


        return [string1 compare:string2];
    };

    NSArray *sortArray = [stringArray sortedArrayUsingComparator:sortBlock];

    NSLog(@"------%@", sortArray);


    //代码块的递归调用
    /*代码块的递归调用，代码块变量必须是全局变量或者静态变量  这样在程序启动的时候代码块变量就初始化了可以递归调用*/

    static void (^ blocks)(int) = ^(int i){


        if (i > 0){
            NSLog(@"num===%d",i);
            blocks(i - 1);
        }
    };

    blocks(6);


};


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end