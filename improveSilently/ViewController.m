//
//  ViewController.m
//  improveSilently
//
//  Created by 丽泽 on 9/24/19.
//  Copyright © 2019 lize. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    // 两个有序数组合并
    [self reorderListMerge];
}

#pragma mark - 有序数组合并
/**
 * 将{1,4,6,7,9}和{2,3,5,6,8,9,10,11,12}合并为{1,2,3,4,5,6,6,7,8,9,9,10,11,12}
 */
- (void)reorderListMerge {
    int aLen = 5, bLen = 9;
    
    int a[] = {1,4,6,7,9};
    int b[] = {2,3,5,6,8,9,10,11,12};
    
    [self printOrderList:a length:aLen];
    [self printOrderList:b length:bLen];
    
    int result[14];
    int p = 0, q = 0, i = 0; // p 是a数组的下标，q是b数组的下标，i是result数组的下标
    // 如果两个数组都还有剩余数据没有放到result数组
    while (p < aLen && q < bLen) {
        if (a[p] <= b[q]) {
            result[i++] = a[p++];
        } else {
            result[i++] = b[q++];
        }
    }
    // 如果a数组还有剩余数据
    while (p < aLen) {
        result[i++] = a[p++];
    }
    // 如果b数组还有剩余数据
    while (q < bLen) {
        result[i++] = b[q++];
    }
    
    [self printOrderList:result length:aLen+bLen];
}

- (void)printOrderList:(int [])list length:(int)len {
    
    for (int i = 0; i< len; i++) {
        printf("%d ", list[i]);
    }
    printf("\n");
}

@end
