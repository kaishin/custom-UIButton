//
//  PXIdSelector.h
//  PXEngine
//
// !WARNING!  Do not include this header file directly in your application. 
//            This file is not part of the public Pixate API and will likely change.
//
//  Created by Kevin Lindsey on 7/9/12.
//  Copyright (c) 2012 Pixate, Inc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PXSelector.h"

/**
 *  A PXIdExpression determines if an element defines an id attribute if it its value matches a specific string.
 */
@interface PXIdSelector : NSObject <PXSelector>

/**
 *  The id value to match
 */
@property (readonly, nonatomic, strong) NSString *idValue;

/**
 *  Initialize a new instance using the specified id name
 *
 *  @param value The id value to match
 */
- (id)initWithIdValue:(NSString *)value;

@end
