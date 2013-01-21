//
//  PXLoggingUtils.h
//  PXEngine
//
// !WARNING!  Do not include this header file directly in your application.
//            This file is not part of the public Pixate API and will likely change.
//
//  Created by Kevin Lindsey on 12/4/12.
//  Copyright (c) 2012 Pixate, Inc. All rights reserved.
//

#ifdef PX_LOGGING
#import <Foundation/Foundation.h>
#import "PXLog.h"

@protocol PXLoggingDelegate <NSObject>
- (void)logEntry:(NSString *)logItem atLogLevel:(int)logLevel;
@end

@interface PXLoggingUtils : NSObject

+ (void)enableLogging;
+ (void)enableLoggingToDirectoryPath:(NSString *)path;
+ (void)setGlobalLoggingLevel:(int)logLevel;
+ (void)addLoggingDelegate:(id <PXLoggingDelegate>)delegate;

@end
#endif
