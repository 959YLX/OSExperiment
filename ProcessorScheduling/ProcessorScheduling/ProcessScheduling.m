//
//  ProcessScheduling.m
//  ProcessorScheduling
//
//  Created by ylx on 2017/5/31.
//  Copyright © 2017年 ylx. All rights reserved.
//

#import "ProcessScheduling.h"

@interface ProcessScheduling()

{
    NSUInteger accounnt;
    NSUInteger pid;
    
    ScheduleType type;
    char *test;
}

@end

@implementation ProcessScheduling


- (instancetype)initWithProcessAccount:(NSUInteger)account
{
    self = [super init];
    if (self) {
        pid = 1;
        NSUInteger priority;
        [ProcessScheduling initPCBList:&_ready];
        [ProcessScheduling initPCBList:&_block];
        for (int i = 0; i < account; i++) {
            priority = (arc4random() % CHARMAX);
            PCB *temp = PCBMake(pid++, ProcessStatusReady, priority);
            sprintf(temp->name, "PROCESS-%d", i + 1);
            temp->next = _ready;
            temp->fount = _ready->fount;
            _ready->fount->next = temp;
            _ready->fount = temp;
        }
        accounnt = account;
        
    }
    return self;
}

+ (void)initPCBList:(PCB**)list
{
    *list = PCBMake(0, ProcessStatusReady, 0);
    free((*list)->name);
    (*list)->name = "HEAD";
    (*list)->next = (*list);
    (*list)->fount = (*list);
}

- (void)addRandomProcess
{
    NSUInteger priority = (arc4random() % CHARMAX);
    PCB* temp = PCBMake(pid++, ProcessStatusReady, priority);
    sprintf(temp->name, "PROCESS-%lu", ++accounnt);
    temp->next = _ready;
    temp->fount = _ready->fount;
    _ready->fount->next = temp;
    _ready->fount = temp;
}

- (void)addProcessWithName:(char*)name andPriority:(NSUInteger)priority
{
    PCB* temp = PCBMake(pid++, ProcessStatusReady, priority);
    free(temp->name);
    temp->name = name;
    temp->next = _ready;
    temp->fount = _ready->fount;
    _ready->fount->next = temp;
    _ready->fount = temp;
}

- (void)blockProcessWithPID:(NSUInteger)PID
{
    
}

- (void)unblockProcessWithPID:(NSUInteger)PID
{
    
}

- (void)printPCB
{
    PCB *temp = _ready;
    for (int i = 0; i < accounnt + 1; i++) {
        NSLog(@"%s,%lu,%lu", temp->name, temp->PID, temp->priority);
        temp = temp->next;
    }
}

- (void)start
{
    type = ScheduleTypeRotate;
    [[[NSThread alloc]initWithTarget:self selector:@selector(schedule) object:nil] start];
}

- (void)schedule
{
    PCB* fount = _ready;
    while (YES) {
        [NSThread sleepForTimeInterval:CLOCK_TIME];
        switch (type) {
            case ScheduleTypeRotate:
            {
                if (fount->PID == 0) {
                    fount = fount->next;
                }
                fount->fount->status = ProcessStatusReady;
                fount->status = ProcessStatusRun;
                _run = *fount;
                fount = fount->next;
                break;
            }
            case ScheduleTypePriority:
                break;
        }
        NSLog(@"%s,%lu", _run.name, _run.PID);
    }
}



@end
