//
//  PCB.h
//  ProcessorScheduling
//
//  Created by ylx on 2017/5/31.
//  Copyright © 2017年 ylx. All rights reserved.
//

#ifndef PCB_h
#define PCB_h

#import<Foundation/Foundation.h>

typedef NS_ENUM (NSInteger,ProcessStatus){
    ProcessStatusRun,
    ProcessStatusHang,
    ProcessStatusReady
};

struct PCB {
    char *name;
    NSUInteger PID;
    ProcessStatus status;
    NSUInteger priority;
    struct PCB *next;
    struct PCB *fount;
};

typedef struct PCB PCB;

static inline PCB*
PCBMake(NSUInteger PID, ProcessStatus status, NSUInteger priority)
{
    PCB *pcb = (PCB*)malloc(sizeof(PCB));
    pcb->name = (char*)malloc(sizeof(char));
    pcb->PID = PID;
    pcb->status = status;
    pcb->priority = priority;
    return pcb;
}


#endif /* PCB_h */
