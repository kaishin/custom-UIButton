//
//  PXLog.h
//  PXEngine
//
// !WARNING!  Do not include this header file directly in your application. 
//            This file is not part of the public Pixate API and will likely change.
//
//  Created by Paul Colton on 12/8/12.
//  Copyright (c) 2012 Pixate, Inc. All rights reserved.
//

#ifdef PX_LOGGING
#import <PXEngine/DDLog.h>

#undef LOG_LEVEL_ERROR
#undef LOG_LEVEL_WARN
#undef LOG_LEVEL_INFO
#undef LOG_LEVEL_VERBOSE

#define LOG_LEVEL_ERROR   (LOG_FLAG_ERROR)                                                    // 0...0001
#define LOG_LEVEL_WARN    (LOG_FLAG_ERROR | LOG_FLAG_WARN)                                    // 0...0011
#define LOG_LEVEL_INFO    (LOG_FLAG_ERROR | LOG_FLAG_WARN | LOG_FLAG_INFO)                    // 0...0111
#define LOG_LEVEL_VERBOSE (LOG_FLAG_ERROR | LOG_FLAG_WARN | LOG_FLAG_INFO | LOG_FLAG_VERBOSE) // 0...1111
#endif
