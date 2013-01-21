//
//  PXEngine.h
//  PXEngine
//
//  Created by Paul Colton on 12/11/12.
//  Copyright (c) 2012 Pixate, Inc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <PXEngine/PXStylesheet.h>
#import <PXEngine/UIView+PXStyling.h>
#import <PXEngine/NSDictionary+PXCSSEncoding.h>

/**
 * This is the main entry point into the Pixate Engine
 */
@interface PXEngine : NSObject

/**
 * The build date of this version of the Pixate Engine
 */
@property (nonatomic, strong, readonly) NSString *version;

/**
 * The build date of this version of the Pixate Engine
 */
@property (nonatomic, strong, readonly) NSDate *buildDate;

/**
 * The email address used for licensing
 */
@property (nonatomic, strong, readonly) NSString *licenseEmail;

/**
 * The user name used for licensing
 */
@property (nonatomic, strong, readonly) NSString *licenseKey;

/**
 * This property, when set to YES, automatically refreshes
 * styling when the orientation of your device changes. This is
 * set to NO by default.
 */
@property (nonatomic) BOOL refreshStylesWithOrientationChange;

/**
 * The shared instance of the PXEngine singleton.
 */
+ (PXEngine *)sharedInstance;

/**
 *  Set the license key and license serial number into the Pixate
 *  Engine. This is required before styling can occur.
 *
 *  @param licenseKey The serial number of your license
 *  @param licenseEmail The user of the license, usually an email address
 */
+ (void) licenseKey:(NSString *)licenseKey forUser:(NSString *)licenseEmail;

@end
