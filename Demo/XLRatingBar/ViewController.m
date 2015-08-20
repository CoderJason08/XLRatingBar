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
    // Do any additional setup after loading the view, typically from a nib.
    XLRatingBar *ratingBar = [[XLRatingBar alloc] initWithFrame:CGRectMake(100, 100, 100, 50)];
    [self.view addSubview:ratingBar];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
