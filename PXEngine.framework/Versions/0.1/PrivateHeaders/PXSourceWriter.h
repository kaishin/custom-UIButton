//
//  PXSourceWriter.h
//  PXEngine
//
// !WARNING!  Do not include this header file directly in your application. 
//            This file is not part of the public Pixate API and will likely change.
//
//  Created by Kevin Lindsey on 6/26/12.
//  Copyright (c) 2012 Pixate, Inc. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PXSourceWriter : NSObject

- (void)increaseIndent;
- (void)decreaseIndent;

- (void)printIndent;
- (void)printWithIndent:(NSString *)text;
- (void)print:(NSString *)text;
- (void)printNewLine;
- (void)printWithNewLine:(NSString *)text;

@end
