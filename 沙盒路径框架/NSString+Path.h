//
//  NSString+Path.h
//  01-沙盒路径
//
//  Created by starxin on 14/3/21.
//  Copyright (c) 2014年 starxin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (Path)

///  拼接文档目录
- (NSString *)appendDocumentDir;

///  拼接缓存目录
- (NSString *)appendCacheDir;

///  拼接临时目录
- (NSString *)appendTmpDir;

@end
