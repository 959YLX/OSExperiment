//
//  ProcessScheduling.m
//  ProcessorScheduling
//
//  Created by ylx on 2017/5/31.
//  Copyright © 2017年 ylx. All rights reserved.
//

#import "ProcessScheduling.h"

@implementation ProcessScheduling


- (instancetype)initWithProcessAccount:(NSUInteger)account
{
    self = [super init];
    if (self) {
        _pid = 1;
        NSUInteger priority;
        for (int i = 0; i < account; i++) {
            priority = (arc4random() % CHARMAX);
            if (i == 0) {
                
                pcb = PCBMake([[NSString stringWithFormat:@"PROCESS-%d", i + 1]UTF8String], _pid++, ProcessStatusReady, priority);
                pcb->next = pcb;
                pcb->fount = pcb;
                continue;
            }
            PCB *temp = PCBMake([[NSString stringWithFormat:@"PROCESS-%d", i + 1]UTF8String], _pid++, ProcessStatusReady, priority);
            temp->next = pcb;
            temp->fount = pcb->fount;
            pcb->fount->next = temp;
            pcb->fount = temp;
        }
        _account = account;
    }
    return self;
}

- (void)addRandomProcess
{
    NSUInteger priority = (arc4random() % CHARMAX);
    PCB* temp = PCBMake([[NSString stringWithFormat:@"PROCESS-%lu", ++_account]UTF8String], _pid++, ProcessStatusReady, priority);
    temp->next = pcb;
    temp->fount = pcb->fount;
    pcb->fount->next = temp;
    pcb->fount = temp;
}

- (void)addProcessWithName:(const char*)name andPriority:(NSUInteger)priority
{
    PCB* temp = PCBMake(name, _pid++, ProcessStatusReady, priority);
    temp->next = pcb;
    temp->fount = pcb->fount;
    pcb->fount->next = temp;
    pcb->fount = temp;
}

- (void)printPCB
{
    PCB *temp = pcb;
    for (int i = 0; i < _account; i++) {
        NSLog(@"%s,%lu,%lu",temp->name, temp->PID, temp->priority);
        temp = temp->next;
    }
}

- (void)startScheduling
{
    
}

@end
