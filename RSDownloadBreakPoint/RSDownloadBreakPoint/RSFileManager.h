//
//  RSFileManager.h
//  RSDownloadBreakPoint
//
//  Created by WhatsXie on 2017/7/21.
//  Copyright © 2017年 StevenXie. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RSFileManager : NSObject

/*根据NSURL获取存储的路径,文件不一定存在*/
+ (NSString *)filePath:(NSURL *)url;
/*获取对应文件的大小*/
+ (long long)fileSize:(NSURL *)url;
/*根据url删除对应的文件*/
+ (BOOL)deleteFile:(NSURL *)url;

@end
