//
//  ProcessScheduling.h
//  ProcessorScheduling
//
//  Created by ylx on 2017/5/31.
//  Copyright © 2017年 ylx. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PCB.h"

#define CHARMAX 255

@interface ProcessScheduling : NSObject

{
    NSUInteger _account;
    NSUInteger _pid;
    PCB *pcb;
}


- (instancetype)initWithProcessAccount:(NSUInteger)account;

- (void)printPCB;

- (void)addRandomProcess;

- (void)addProcessWithName:(const char*)name PID:(NSUInteger)pid andPriority:(NSUInteger)priority;

- (void)startScheduling;

@end
