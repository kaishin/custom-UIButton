//
//  PXNumberMatcher.h
//  PXEngine
//
// !WARNING!  Do not include this header file directly in your application. 
//            This file is not part of the public Pixate API and will likely change.
//
//  Created by Kevin Lindsey on 6/23/12.
//  Copyright (c) 2012 Pixate, Inc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PXPatternMatcher.h"

@interface PXNumberMatcher : PXPatternMatcher

- (id)initWithType:(int)type;
- (id)initWithType:(int)type withDictionary:(NSDictionary *)dictionary withUnknownType:(int)unknownType;

@end
