//
//  PXSourceEmitter.h
//  PXEngine
//
// !WARNING!  Do not include this header file directly in your application. 
//            This file is not part of the public Pixate API and will likely change.
//
//  Created by Kevin Lindsey on 9/28/12.
//  Copyright (c) 2012 Pixate, Inc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PXSourceWriter.h"

@protocol PXSourceEmitter <NSObject>

@optional
- (NSString *)source;
- (void)sourceWithSourceWriter:(PXSourceWriter *)writer;

@end
