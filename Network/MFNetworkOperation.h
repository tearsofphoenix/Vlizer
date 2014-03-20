//
//  MFNetworkOperation.h
//  CMBFoundation
//
//  Created by Mac003 on 13-12-26.
//  Copyright (c) 2013年 Mac003. All rights reserved.
//

#import "MFRunLoopOperation.h"
#import "MFNetworkClient.h"

@class MFNetworkOperation;

@protocol MFNetworkOperationDelegate <NSObject>

- (void)operationWillFinish: (MFNetworkOperation *)operation;

@end

@interface MFNetworkOperation : MFRunLoopOperation

- (id)initWithURL: (NSURL *)URL
       parameters: (NSDictionary *)parameters
 lifeTimeInterval: (NSTimeInterval)lifeTimeInterval
         callback: (MFNetworkConnectionCallback)callback;

- (NSURL *)URL;
- (NSTimeInterval)lifeTimeInterval;
- (MFNetworkConnectionCallback)callback;
- (NSData *)receivedData;

@property (nonatomic, assign) id<MFNetworkOperationDelegate> delegate;
@property (nonatomic, retain) NSThread *callbackThread;

@end
