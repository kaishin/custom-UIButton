//
//  PXSelector.h
//  PXEngine
//
// !WARNING!  Do not include this header file directly in your application. 
//            This file is not part of the public Pixate API and will likely change.
//
//  Created by Kevin Lindsey on 9/1/12.
//  Copyright (c) 2012 Pixate, Inc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <PXEngine/PXStyleable.h>
#import "PXSourceEmitter.h"
#import "PXSpecificity.h"

/**
 *  The PXElementMatcher protocol defines a method used to determine if a given object matches a specific selector
 *  expression as captured by the class the conforms to this protocol.
 */
@protocol PXSelector <PXSourceEmitter>

/**
 *  Determine if the specified element matches this PXElementMatcher
 */
- (BOOL)matches:(id<PXStyleable>)element;

/**
 *  Update the specified PXSpecificity instance as is appropriate for the class that conforms to this protocol
 */
- (void)incrementSpecificity:(PXSpecificity *)specificity;

@end
