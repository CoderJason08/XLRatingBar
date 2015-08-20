//
//  ViewController.m
//  XLRatingBar
//
//  Created by Jason on 15/8/16.
//  Copyright (c) 2015年 Jason. All rights reserved.
//

#import "ViewController.h"
#import "XLRatingBar.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor blackColor];

    XLRatingBar *ratingBar = [[XLRatingBar alloc] initWithFrame:CGRectMake(100, 100, 200, 50)];
    [ratingBar addTarget:self action:@selector(valueChange:) forControlEvents:UIControlEventValueChanged];
    [self.view addSubview:ratingBar];
}

- (void)valueChange:(XLRatingBar *)bar {
    NSLog(@"%d",bar.currentStar);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
