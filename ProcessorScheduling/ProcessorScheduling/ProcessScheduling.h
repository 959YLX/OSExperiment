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
#define CLOCK_TIME 1  //时钟时间(s)
#define MAX_RUN_TIME 2  //进程运行最长时间,单位时钟周期

typedef NS_ENUM(NSInteger, ScheduleType){
    ScheduleTypePriority,   //优先权调度
    ScheduleTypeRotate  //时间轮转调度
};

@interface ProcessScheduling : NSObject

@property(nonatomic, strong)NSThread *thread;
@property(nonatomic, assign)PCB *ready;
@property(nonatomic, assign)PCB *block;
@property(nonatomic, assign)PCB run;

- (instancetype)initWithProcessAccount:(NSUInteger)account;

- (void)printPCB;

- (void)addRandomProcess;

- (void)addProcessWithName:(char*)name andPriority:(NSUInteger)priority;

- (void)blockProcessWithPID:(NSUInteger)PID;

- (void)unblockProcessWithPID:(NSUInteger)PID;

- (void)start;

+ (void)initPCBList:(PCB**)list;

@end
