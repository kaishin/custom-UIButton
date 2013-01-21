//
//  PXPatternMatcher.h
//  PXEngine
//
// !WARNING!  Do not include this header file directly in your application. 
//            This file is not part of the public Pixate API and will likely change.
//
//  Created by Kevin Lindsey on 6/23/12.
//  Copyright (c) 2012 Pixate, Inc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PXLexemeCreator.h"

@interface PXPatternMatcher : NSObject <PXLexemeCreator>
{
    @protected
    NSRegularExpression *pattern;
}

@property (readonly, nonatomic) int type;
@property (readonly, nonatomic, strong) NSString *name;

- (id)initWithType:(int)type withPatternString:(NSString *)patternString;
- (id)initWithType:(int)type withRegularExpression:(NSRegularExpression *)aPattern;

@end
