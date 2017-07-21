//
//  RSFileManager.m
//  RSDownloadBreakPoint
//
//  Created by WhatsXie on 2017/7/21.
//  Copyright © 2017年 StevenXie. All rights reserved.
//

#import "RSFileManager.h"

@implementation RSFileManager

/*根据NSURL获取存储的路径,文件不一定存在*/
+ (NSString *)filePath:(NSURL *)url {
    NSString *path = [NSHomeDirectory() stringByAppendingString:@"/Documents/WhdeBreakPoint/" ];
    /*base64编码*/
    NSData *data = [url.absoluteString.lastPathComponent dataUsingEncoding:NSUTF8StringEncoding];
    NSString *filename = [data base64EncodedStringWithOptions:NSDataBase64EncodingEndLineWithLineFeed];
    path = [path stringByAppendingString:filename];
    return path;
}

/*获取对应文件的大小*/
+ (long long)fileSize:(NSURL *)url {
    NSString *path = [RSFileManager filePath:url];
    long long downloadedBytes = 0;
    NSFileManager *fileManager = [NSFileManager defaultManager];
    if ([fileManager fileExistsAtPath:path]) {
        NSDictionary *fileDict = [fileManager attributesOfItemAtPath:path error:nil];
        downloadedBytes = [fileDict fileSize];
    } else {
        if ([fileManager fileExistsAtPath:[path stringByDeletingLastPathComponent] isDirectory:nil]) {
            
        }else if (![fileManager createDirectoryAtPath:[path stringByDeletingLastPathComponent] withIntermediateDirectories:YES attributes:nil error:nil]) {
            NSLog(@"create path fail");
        }
        /*文件不存在,创建文件*/
        if (![fileManager createFileAtPath:path contents:nil attributes:nil]) {
            NSLog(@"create file fail");
        }
    }
    return downloadedBytes;
}
/*根据url删除对应的文件*/
+ (BOOL)deleteFile:(NSURL *)url {
    NSString *path = [RSFileManager filePath:url];
    NSFileManager *fileManager = [NSFileManager defaultManager];
    return [fileManager removeItemAtPath:path error:nil];
}


@end
