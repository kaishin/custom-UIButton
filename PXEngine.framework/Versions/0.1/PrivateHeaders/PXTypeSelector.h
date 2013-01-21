//
//  PXTypeSelector.h
//  PXEngine
//
// !WARNING!  Do not include this header file directly in your application. 
//            This file is not part of the public Pixate API and will likely change.
//
//  Created by Kevin Lindsey on 7/9/12.
//  Copyright (c) 2012 Pixate, Inc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <PXEngine/PXStyleable.h>
#import "PXSelector.h"
#import "PXIdSelector.h"
#import "PXSpecificity.h"

/**
 *  A PXTypeSelector is reponsible for matching an element by namespace (optional) and name.
 */
@interface PXTypeSelector : NSObject <PXSelector>

/**
 *  The element/type namespace URI to match. This value may be nil
 */
@property (readonly, nonatomic, strong) NSString *namespaceURI;

/**
 *  The element/type namespace prefix to match. This value may be nil
 */
@property (readonly, nonatomic, strong) NSString *typeName;

/**
 *  The selector uses a universal namespace
 */
@property (readonly, nonatomic) BOOL hasUniversalNamespace;

/**
 *  The selector uses a universal type
 */
@property (readonly, nonatomic) BOOL hasUniversalType;

/**
 *  A unmutable list of attribute expressions associated with this selector
 */
@property (readonly, nonatomic, strong) NSArray *attributeExpressions;

/**
 *  Determine if this selector contains any pseudo-classes
 */
@property (readonly, nonatomic) BOOL hasPseudoClasses;

/**
 *  Initialize a new instance with the specified element name
 *
 *  @param type The element name to match
 */
- (id)initWithTypeName:(NSString *)type;

/**
 *  Initializer a new instance with the specified element namespace and name
 *
 *  @param uri The element namespace URI to match
 *  @param type The element name to match
 */
- (id)initWithNamespaceURI:(NSString *)uri typeName:(NSString *)type;

/**
 *  Add an attribute expression to this selector. This selector matches only if it and it's attribute expressions all
 *  match
 *
 *  @param expression The expression to add to this selector
 */
- (void)addAttributeExpression:(id<PXSelector>)expression;

/**
 *  Determine if this selector contains a pseudo-class for the given type
 *
 *  @param className The pseudo-class name
 */
- (BOOL)hasPseudoClass:(NSString *)className;

@end
