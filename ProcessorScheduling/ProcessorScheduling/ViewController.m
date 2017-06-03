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
    NSButton *button = [NSButton buttonWithTitle:@"RUN" target:self action:@selector(click)];
    button.frame = CGRectMake(100, 100, 100, 50);
    [self.view addSubview:button];
    _processScheduling = [[ProcessScheduling alloc]initWithProcessAccount:5];
}


- (void)setRepresentedObject:(id)representedObject {
    [super setRepresentedObject:representedObject];

    // Update the view, if already loaded.
}

- (void)click
{
    [_processScheduling start];
}

@end
