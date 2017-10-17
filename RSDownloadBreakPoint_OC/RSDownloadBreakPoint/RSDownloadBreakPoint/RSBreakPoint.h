//
//  RSBreakPoint.h
//  RSDownloadBreakPoint
//
//  Created by WhatsXie on 2017/7/21.
//  Copyright © 2017年 StevenXie. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "RSSession.h"

@interface RSBreakPoint : NSObject

/*异步下载*/
+ (RSSession *)asynDownloadWithUrl:(NSString *)urlStr progressBlock:(ProgressBlock)progress successBlock:(SuccessBlock) success failureBlock:(FailureBlock)failure;
/*取消*/
+ (void)cancel:(NSString *)urlStr;
/*暂停*/
+ (void)pause:(NSString *)urlStr;

@end
