//
//  ViewController.m
//  ProcessorScheduling
//
//  Created by ylx on 2017/5/31.
//  Copyright © 2017年 ylx. All rights reserved.
//

#import "ViewController.h"

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [[[ProcessScheduling alloc]initWithProcessAccount:10]printPCB];
    // Do any additional setup after loading the view.
}


- (void)setRepresentedObject:(id)representedObject {
    [super setRepresentedObject:representedObject];

    // Update the view, if already loaded.
}


@end
