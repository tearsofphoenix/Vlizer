//
//  MFNetworkFileCacheManagerInternal.m
//  CMBFoundation
//
//  Created by Mac003 on 13-12-27.
//  Copyright (c) 2013年 Mac003. All rights reserved.
//

#import "MFNetworkFileCacheManagerInternal.h"
#import "NSString+CMBExtensions.h"

@implementation MFNetworkFileCacheManagerInternal

- (id)init
{
    if ((self = [super init]))
    {
        NSError *error = nil;
        
        [[NSFileManager defaultManager] createDirectoryAtPath: [[self class] _cacheFolderPath]
                                  withIntermediateDirectories: YES
                                                   attributes: nil
                                                        error: &error];
        if (error)
        {
            NSLog(@"in func: %s error: %@", __func__, [error localizedDescription]);
        }
    }
    
    return self;
}

static NSString *gsCacheFolderPath = nil;

+ (NSString *)_cacheFolderPath
{
    if (!gsCacheFolderPath)
    {
        gsCacheFolderPath = [[NSSearchPathForDirectoriesInDomains(NSLibraryDirectory,
                                                                  NSUserDomainMask, YES)[0] stringByAppendingPathComponent: @"/.cmb-caches/"] retain];
    }
    
    return gsCacheFolderPath;
}

- (void)cacheData: (NSData *)data
           withID: (NSString *)fileID
{
    if (data && fileID)
    {
        //fileID = [fileID CMBMP(MD5String)];
        NSString *localPath = [[[self class] _cacheFolderPath] stringByAppendingPathComponent: fileID];
        
        NSError *error = nil;
        
        [data writeToFile: localPath
                  options: NSDataWritingAtomic
                    error: &error];
        
        if (error)
        {
            NSLog(@"in func: %s error: %@", __func__, [error localizedDescription]);
        }
    }
}

- (NSData *)dataForFileID: (NSString *)fileID
{
    NSString *path = [[self class] _cacheFolderPath];
    //fileID = [fileID CMBMP(MD5String)];
    
    path = [path stringByAppendingPathComponent: fileID];
    
    NSFileManager *fileManager = [NSFileManager defaultManager];
    
    if ([fileManager fileExistsAtPath: path])
    {
        return [NSData dataWithContentsOfFile: path];
    }else
    {
        return nil;
    }
}

- (void)clearCache
{
    NSString *cachePath = [[self class] _cacheFolderPath];
    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSError *error = nil;
    
    [fileManager removeItemAtPath: cachePath
                            error: &error];
    
    if (error)
    {
        NSLog(@"in func: %s error: %@", __func__, [error localizedDescription]);
    }
    
    error = nil;
    
    [fileManager createDirectoryAtPath: cachePath
           withIntermediateDirectories: YES
                            attributes: nil
                                 error: &error];
    
    if (error)
    {
        NSLog(@"in func: %s error: %@", __func__, [error localizedDescription]);
    }
}

@end
