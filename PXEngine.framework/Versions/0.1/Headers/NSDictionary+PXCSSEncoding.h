//
//  NSDictionary+PXCSSEncoding.h
//  PXEngine
//
// !WARNING!  Do not include this header file directly in your application. 
//            This file is not part of the public Pixate API and will likely change.
//
//  Created by Paul Colton on 12/18/12.
//  Copyright (c) 2012 Pixate, Inc. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDictionary (PXCSSEncoding)
-(NSString *)toCSS;
@end
