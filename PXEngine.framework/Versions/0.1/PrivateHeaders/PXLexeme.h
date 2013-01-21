//
//  PXLexeme.h
//  PXEngine
//
// !WARNING!  Do not include this header file directly in your application. 
//            This file is not part of the public Pixate API and will likely change.
//
//  Created by Kevin Lindsey on 6/23/12.
//  Copyright (c) 2012 Pixate, Inc. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum {
    PXLexemeFlagFollowsWhitespace = 1
} PXLexemeFlagType;

@interface PXLexeme : NSObject

@property (readonly, nonatomic) int type;
@property (readonly, nonatomic, strong) NSString *typeName;
@property (readonly, nonatomic, strong) id value;
@property (readonly, nonatomic) NSRange range;

+ (id)lexemeWithType:(int)type;
+ (id)lexemeWithType:(int)type withRange:(NSRange)range;
+ (id)lexemeWithType:(int)type withValue:(id)value;
+ (id)lexemeWithType:(int)type withRange:(NSRange)range withValue:(id)value;

- (id)initWithType:(int)type withRange:(NSRange)range withValue:(id)value;

- (void)clearFlag:(PXLexemeFlagType)type;
- (void)setFlag:(PXLexemeFlagType)type;
- (BOOL)flagIsSet:(PXLexemeFlagType)type;
- (BOOL)followsWhitespace;

@end
