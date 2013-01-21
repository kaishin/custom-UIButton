//
//  PXDeclaration.h
//  PXEngine
//
// !WARNING!  Do not include this header file directly in your application.
//            This file is not part of the public Pixate API and will likely change.
//
//  Created by Kevin Lindsey on 9/1/12.
//  Copyright (c) 2012 Pixate, Inc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <PXEngine/PXPaint.h>
#import <PXEngine/PXShadow.h>
#import <PXEngine/PXDimension.h>
#import <PXEngine/PXCornerRadius.h>
#import <PXEngine/PXMargin.h>

/**
 *  PXDeclaration represents a single property/value pair in a CSS rule set. A declaration consists of a property name
 *  and a property value. However, due to the nature of Pixate's 2-pass parsing, the property value in these instances
 *  is actually an array of lexemes. As such, a number of convenience methods are provided to convert the lexemes to a
 *  concrete value type.
 */
@interface PXDeclaration : NSObject

@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSArray *lexemes;
@property (nonatomic) BOOL important;

/**
 *  Initializes a newly allocated PXDeclaration using the specified property name
 *
 *  @param name The property name for this declaration
 */
- (id)initWithName:(NSString *)name;

/**
 *  Initializes a newly allocated PXDeclaration using the specified property name and value. The value will be tokenized
 *  to populate the lexemes property.
 *
 *  @param name The property name
 *  @param value The property value
 */
- (id)initWithName:(NSString *)name value:(NSString *)value;

/**
 *  Convert the declaration value to a color value
 */
- (UIColor *)colorValue;

/**
 *  Convert the declaration value to a float value
 */
- (CGFloat)floatValue;

/**
 *  Convert the declaration value to a line break mode enumeration value
 */
- (UILineBreakMode)lineBreakModeValue;

/**
 *  Convert the declaration value to a margin value
 */
- (PXMargin *)marginValue;

/**
 *  Convert the declaration value to a paint value
 */
- (id<PXPaint>)paintValue;

/**
 *  Convert the declaration value to a size value
 */
- (CGSize)sizeValue;

/**
 *  Convert the declaration value to a shadow value
 */
- (PXShadow *)shadowValue;

/**
 *  Convert the declaration value to a string value
 */
- (NSString *)stringValue;

/**
 *  Convert the declaration value to a text alignment enumeration value
 */
- (UITextAlignment)textAlignmentValue;

/**
 *  Treat the string value of this declaration as a text-transform value. Apply the text transform to the specified
 *  string and return the result
 *
 *  @param value The string to transform
 */
- (NSString *)transformString:(NSString *)value;

/**
 *  Convert the declaration value to a CGAffineTransformation using the SVG transform syntax
 */
- (CGAffineTransform)affineTransformValue;

/**
 *  Convert the declaration value to a URL
 */
- (NSURL *)URLValue;

/**
 *  Convert the declaration value to a UIEdgeInsets value
 */
- (UIEdgeInsets)insetsValue;

/**
 *  Convert the declaration value to a PXCornerRadius value
 */
- (PXCornerRadius *)cornerRadiusValue;

/**
 *  Convert the declaration value to a PXDimension value
 */
- (PXDimension *)dimensionValue;

@end
