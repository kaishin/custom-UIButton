//
//  PXSpecificity.h
//  PXEngine
//
// !WARNING!  Do not include this header file directly in your application. 
//            This file is not part of the public Pixate API and will likely change.
//
//  Created by Kevin Lindsey on 7/10/12.
//  Copyright (c) 2012 Pixate, Inc. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 *  The PXSpecificityType enumeration defines a list of specificity levels for rule sets based on the rule sets
 *  selector
 */
typedef enum
{
    kSpecificityTypeOrigin,
    kSpecificityTypeId,
    kSpecificityTypeClassOrAttribute,
    kSpecificityTypeElement
} PXSpecificityType;

/**
 *  A PXSpecificity represents an order lists of specificities based on specificity type. Instances of this class are
 *  used to determine the specificity of declarations in order to derive a list of declarations to apply given a set of
 *  rule sets being applied to a given element.
 */
@interface PXSpecificity : NSObject

/**
 *  Compare the current specificity to another, returning a CFComparisonResult. This is used to sort arrays of
 *  items with specificity, typically PXRuleSets
 *
 *  @param specificity The other PXSpecificity to compare against
 */
- (CFComparisonResult)compareSpecificity:(PXSpecificity *)specificity;

/**
 *  Increase the specificity counter for the given specificity type
 *
 *  @param specificity The specificity type being incremented
 */
- (void)incrementSpecifity:(PXSpecificityType)specificity;

/**
 *  Set the specificity counter for a given specificity type
 *
 *  @param specificity The specificity type being set
 *  @param value The new value
 */
- (void)setSpecificity:(PXSpecificityType)specificity toValue:(int)value;

@end
