//
//  RSBreakPoint.m
//  RSDownloadBreakPoint
//
//  Created by WhatsXie on 2017/7/21.
//  Copyright © 2017年 StevenXie. All rights reserved.
//

#import "RSBreakPoint.h"
static NSMutableArray *_sessionArray; // [struct Request,struct Request]
@implementation RSBreakPoint
+ (void)load {
    _sessionArray = [NSMutableArray arrayWithCapacity:50];
}
/*异步下载*/
+ (RSSession *)asynDownloadWithUrl:(NSString *)urlStr progressBlock:(ProgressBlock)progress successBlock:(SuccessBlock) success failureBlock:(FailureBlock)failure {
    for (RSSession *session in _sessionArray) {
        if ([session.url.absoluteString isEqual:urlStr] == true) {
            return session;
        }
    }
    RSSession *session = [RSSession asynDownloadWithUrl:urlStr progressBlock:progress successBlock:success failureBlock:failure callCancelBlock:^(BOOL cancel) {
        /*WhdeSession取消请求,数组中将移除对应的请求*/
        for (RSSession *session in _sessionArray) {
            if ([session.url.absoluteString isEqual:urlStr] == true) {
                [_sessionArray removeObject:session];
                break;
            }
        }
    }];
    /*添加到数组*/
    [_sessionArray addObject:session];
    return session;
}
/*取消*/
+ (void)cancel:(NSString *)urlStr {
    /*查找数组中对应的请求*/
    for (RSSession *session in _sessionArray) {
        if ([session.url.absoluteString isEqual:urlStr] == true) {
            [session cancel];
            break;
        }
    }
}
/*暂停*/
+ (void)pause:(NSString *)urlStr {
    /*查找数组中对应的请求*/
    for (RSSession *session in _sessionArray) {
        if ([session.url.absoluteString isEqual:urlStr] == true) {
            [session cancel];
            break;
        }
    }
}
@end
