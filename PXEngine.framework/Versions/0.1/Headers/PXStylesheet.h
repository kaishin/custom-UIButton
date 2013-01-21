//
//  PXStylesheet.h
//  PXEngine
//
//  Created by Kevin Lindsey on 7/10/12.
//  Copyright (c) 2012 Pixate, Inc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <PXEngine/PXRuleSet.h>
#import <PXEngine/PXStyleable.h>

@protocol PXMediaExpression;
@class PXMediaGroup;

extern NSString *const kPXStylesheetDidChangeNotification;
extern NSString *const kPXUpdateStyleNotification;

/**
 *  A PXStylesheetOrigin enumeration captures the various stylesheet origins (application, user, and view) which are
 *  used when determining cascading and weights of declarations.
 */
typedef enum
{
    kStylesheetOriginApplication,
    kStylesheetOriginUser,
    kStylesheetOriginView,
    kStylesheetOriginInline
} PXStylesheetOrigin;

/**
 *  A PXStylesheet typically corresponds to a single CSS file. Each stylesheet contains a list of rule sets defined
 *  within it.
 */
@interface PXStylesheet : NSObject

/**
 *  A PXStylesheetOrigin enumeration value indicating the origin of this stylesheet. Origin values are used in
 *  specificity calculations.
 */
@property (readonly, nonatomic) PXStylesheetOrigin origin;

/**
 *  A nonmutable array of rule sets that are contained within this stylesheet
 */
@property (readonly, nonatomic, strong) NSArray *ruleSets;

/**
 *  A nonmutable array of media groups that are contained within this stylesheet
 */
@property (readonly, nonatomic, strong) NSArray *mediaGroups;

/**
 *  The current media query that applies to any rule sets added to this stylesheet
 */
@property (nonatomic, strong) id<PXMediaExpression> activeMediaQuery;

/**
 *  A nonmutable array of error strings that were encountered when parsing the source of this stylesheet
 */
@property (nonatomic, strong) NSArray *errors;

/**
 *  The string path to the file containing the source of this stylesheet
 */
@property (nonatomic, strong) NSString *filePath;

/**
 *  A flag to watch the file for changes. If file changes, then a call to sendChangeNotifation is made.
 */
@property (nonatomic, assign) BOOL monitorChanges;

/**
 *  Allocate and initialize a new stylesheet using the specified source and stylesheet origin
 *
 *  @param source The CSS source for this stylesheet
 *  @param origin The specificity origin for this stylesheet
 */
+ (id)styleSheetFromSource:(NSString *)source withOrigin:(PXStylesheetOrigin)origin;

/**
 *  Allocate and initialize a new styleheet for the specified path and stylesheet origin
 *
 *  @param filePath The string path to the stylesheet file
 *  @param origin The specificity origin for this stylesheet
 */
+ (id)styleSheetFromFilePath:(NSString *)filePath withOrigin:(PXStylesheetOrigin)origin;

/**
 *  A class-level getter returning the current application-level stylesheet. This value may be nil
 */
+ (PXStylesheet *)currentApplicationStylesheet;

/**
 *  A class-level getter returning the current user-level stylesheet. This value may be nil
 */
+ (PXStylesheet *)currentUserStylesheet;

/**
 *  A class-level getter returning the current view-level stylesheet. This value may be nil
 */
+ (PXStylesheet *)currentViewStylesheet;

/**
 *  Apply all registered stylesheet (i.e. Application, User, and/or View)
 */
+ (void)applyStylesheets;

/**
 *  Initialize a new stylesheet instance and set its stylesheet origin
 *
 *  @param origin The specificity origin for this stylesheet
 */
- (id)initWithOrigin:(PXStylesheetOrigin)origin;

/**
 *  Add a new rule set to this stylesheet
 *
 *  @param ruleSet The rule set to add. Nil values are ignored
 */
- (void)addRuleSet:(PXRuleSet *)ruleSet;

/**
 *  Return a list of rule sets whose selectors match against a specified element
 *
 *  @param element The element to match against
 */
- (NSArray *)ruleSetsMatchingStyleable:(id<PXStyleable>)element;

/**
 *  Register a namespace URI for a given prefix. If the prefix is nil or an empty string, then this method sets the
 *  default namespace URI.
 *
 *  @param uri The URI (as a string) for the namespace
 *  @param prefix The namespace prefix to associate with the namespace URI
 */
- (void)setURI:(NSString *)uri forNamespacePrefix:(NSString *)prefix;

/**
 *  Return the namespace URI for the specified prefix. If prefix is nil or an empty string, then the default namespace
 *  URI will be returned, if one has been defined
 *
 *  @param prefix The namespace prefix
 */
- (NSString *)namespaceForPrefix:(NSString *)prefix;

@end
