//
//  PXSSTokenType.h
//  PXEngine
//
// !WARNING!  Do not include this header file directly in your application. 
//            This file is not part of the public Pixate API and will likely change.
//
//  Created by Kevin Lindsey on 6/23/12.
//  Copyright (c) 2012 Pixate, Inc. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 *  A list of iCSS token types
 */
typedef enum
{
    PXSS_ERROR = -1,
    PXSS_EOF,

    PXSS_WHITESPACE,

    PXSS_NUMBER,
    PXSS_CLASS,
    PXSS_ID,
    PXSS_IDENTIFIER,

    PXSS_LCURLY,
    PXSS_RCURLY,
    PXSS_LPAREN,
    PXSS_RPAREN,
    PXSS_LBRACKET,
    PXSS_RBRACKET,

    PXSS_SEMICOLON,
    PXSS_GREATER_THAN,
    PXSS_PLUS,
    PXSS_TILDE,
    PXSS_STAR,
    PXSS_EQUAL,
    PXSS_COLON,
    PXSS_COMMA,
    PXSS_PIPE,

    PXSS_DOUBLE_COLON,
    PXSS_STARTS_WITH,
    PXSS_ENDS_WITH,
    PXSS_CONTAINS,
    PXSS_LIST_CONTAINS,
    PXSS_EQUALS_WITH_HYPHEN,

    PXSS_STRING,
    PXSS_LINEAR_GRADIENT,
    PXSS_RADIAL_GRADIENT,
    PXSS_HSL,
    PXSS_HSLA,
    PXSS_HSB,
    PXSS_HSBA,
    PXSS_RGB,
    PXSS_RGBA,
    PXSS_HEX_COLOR,
    PXSS_URL,
    PXSS_NAMESPACE,

    PXSS_NOT_PSEUDO_CLASS,
    PXSS_LINK_PSEUDO_CLASS,
    PXSS_VISITED_PSEUDO_CLASS,
    PXSS_HOVER_PSEUDO_CLASS,
    PXSS_ACTIVE_PSEUDO_CLASS,
    PXSS_FOCUS_PSEUDO_CLASS,
    PXSS_TARGET_PSEUDO_CLASS,
    PXSS_LANG_PSEUDO_CLASS,
    PXSS_ENABLED_PSEUDO_CLASS,
    PXSS_CHECKED_PSEUDO_CLASS,
    PXSS_INDETERMINATE_PSEUDO_CLASS,
    PXSS_ROOT_PSEUDO_CLASS,
    PXSS_NTH_CHILD_PSEUDO_CLASS,
    PXSS_NTH_LAST_CHILD_PSEUDO_CLASS,
    PXSS_NTH_OF_TYPE_PSEUDO_CLASS,
    PXSS_NTH_LAST_OF_TYPE_PSEUDO_CLASS,
    PXSS_FIRST_CHILD_PSEUDO_CLASS,
    PXSS_LAST_CHILD_PSEUDO_CLASS,
    PXSS_FIRST_OF_TYPE_PSEUDO_CLASS,
    PXSS_LAST_OF_TYPE_PSEUDO_CLASS,
    PXSS_ONLY_CHILD_PSEUDO_CLASS,
    PXSS_ONLY_OF_TYPE_PSEUDO_CLASS,
    PXSS_EMPTY_PSEUDO_CLASS,
    PXSS_NTH,

    PXSS_KEYFRAMES,
    PXSS_IMPORTANT,
    PXSS_IMPORT,
    PXSS_MEDIA,
    PXSS_AND,

    PXSS_EMS,
    PXSS_EXS,
    PXSS_LENGTH,
    PXSS_ANGLE,
    PXSS_TIME,
    PXSS_FREQUENCY,
    PXSS_DIMENSION,
    PXSS_PERCENTAGE

} PXStylesheetTokens;

/**
 *  A singleton used to indicate the type of a given lexeme
 */
@interface PXStylesheetTokenType : NSObject

/**
 *  Return a display name for the specified token type. This is used for debugging and error reporting.
 *
 *  @param type The value of the enumeration to convert to a string
 */
+ (NSString *)typeNameForInt:(PXStylesheetTokens)type;

@end
