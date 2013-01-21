//
//  PXRuleSet.h
//  PXEngine
//
// !WARNING!  Do not include this header file directly in your application. 
//            This file is not part of the public Pixate API and will likely change.
//
//  Created by Kevin Lindsey on 7/3/12.
//  Copyright (c) 2012 Pixate, Inc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <PXEngine/PXSpecificity.h>
#import <PXEngine/PXTypeSelector.h>
#import <PXEngine/PXDeclaration.h>
#import <PXEngine/PXStyleable.h>

/**
 *  A PXRuleSet represents a single CSS rule set. A rule set consists of selectors and declarations. A specificity is
 *  associated with each rule set to assist in the calculation of weights and cascading of declarations.
 */
@interface PXRuleSet : NSObject

/**
 *  A nonmutable array of selectors.
 *
 *  When a selector consists of a comma-delimited list, each item is added to this rule set
 */
@property (readonly, nonatomic) NSArray *selectors;

/**
 *  A nonmutable array of declarations.
 */
@property (readonly, nonatomic) NSArray *declarations;

/**
 *  The specificity of this rule set as calculated based on the rule set's selectors
 */
@property (readonly, nonatomic) PXSpecificity *specificity;

/**
 *  Returns the final selector which determines what target types will be selected
 */
@property (readonly, nonatomic) PXTypeSelector *targetTypeSelector;

/**
 *  A class method used to merge multiple rule sets into a single rule set, taking specificity of each rule set into
 *  account. The resulting rule set's selectors and specificity properties are undefined.
 *
 *  @param ruleSets An array of rule sets to merge
 */
+ (id)ruleSetWithMergedRuleSets:(NSArray *)ruleSets;

/**
 *  Add a selector to the list of selectors associated with this rule set
 *
 *  @param selector The selector to add
 */
- (void)addSelector:(id<PXSelector>)selector;

/**
 *  Add a declaration to the list of declarations associated with this rule set
 *
 *  @param declaration The declaration to add
 */
- (void)addDeclaration:(PXDeclaration *)declaration;

/**
 *  A predicate used to determine if this rule set contains a declaration for a given property name
 *
 *  @param name The name of the property to look for
 */
- (BOOL)hasDeclarationForName:(NSString *)name;

/**
 *  Return the declaration associated with a specified name. Nil will be returned if the rule set does not contain a
 *  declaration for the given name.
 *
 *  @param name The name of the property to return
 */
- (PXDeclaration *)declarationForName:(NSString *)name;

/**
 *  Determine if a given element matches the selector associated with this rule set
 *
 *  @param element The element to test
 */
- (BOOL)matches:(id<PXStyleable>)element;

@end
