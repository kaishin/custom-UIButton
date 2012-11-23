#import "CBHybrid.h"

@implementation CBHybrid


// Resizable background image for normal state
static UIImage *gBackgroundImage;

// Resizable background image for highlighted state
static UIImage *gBackgroundImageHighlighted;

// Background image border radius and height
static int borderRadius = 5;
static int height = 37;

#pragma mark - Overrides

+ (CBHybrid *)buttonWithType:(UIButtonType)type
{
    return [super buttonWithType:UIButtonTypeCustom];
}

- (id)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if (self) {
        [self setupBackgrounds];
    }
    
    return self;
}

#pragma mark - Helper Methods

- (void)setupBackgrounds {
    
    // Generate background images if necessary
    if (!gBackgroundImage && !gBackgroundImageHighlighted) {
        gBackgroundImage = [[self drawBackgroundImageHighlighted:NO] resizableImageWithCapInsets:UIEdgeInsetsMake(borderRadius, borderRadius, borderRadius, borderRadius) resizingMode:UIImageResizingModeStretch];
        gBackgroundImageHighlighted = [[self drawBackgroundImageHighlighted:YES] resizableImageWithCapInsets:UIEdgeInsetsMake(borderRadius, borderRadius, borderRadius, borderRadius) resizingMode:UIImageResizingModeStretch];
    }
    
    // Set background for the button instance
    [self setBackgroundImage:gBackgroundImage forState:UIControlStateNormal];
    [self setBackgroundImage:gBackgroundImageHighlighted forState:UIControlStateHighlighted];
}

- (UIImage *)drawBackgroundImageHighlighted:(BOOL)highlighted {
    
    // Get image width with a 1pt stretchable area
    float width = 1 + (borderRadius * 2);
    
    // Create bitmap context and color space
    UIGraphicsBeginImageContextWithOptions(CGSizeMake(width, height), NO, 0.0);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    
    // Color Declarations
    UIColor *borderColor = [UIColor colorWithRed:0.77f green:0.43f blue:0.00f alpha:1.00f];
    UIColor *topColor = [UIColor colorWithRed:0.94f green:0.82f blue:0.52f alpha:1.00f];
    UIColor *bottomColor = [UIColor colorWithRed:0.91f green:0.55f blue:0.00f alpha:1.00f];
    UIColor *innerGlow = [UIColor colorWithWhite:1.0 alpha:0.5];
    
    // Gradient Declarations
    NSArray *gradientColors = (@[
                               (id)topColor.CGColor,
                               (id)bottomColor.CGColor
                               ]);
    
    CGGradientRef gradient = CGGradientCreateWithColors(colorSpace, (__bridge CFArrayRef)(gradientColors), NULL);
    
    NSArray *highlightedGradientColors = (@[
                                          (id)bottomColor.CGColor,
                                          (id)topColor.CGColor
                                          ]);
    
    CGGradientRef highlightedGradient = CGGradientCreateWithColors(colorSpace, (__bridge CFArrayRef)(highlightedGradientColors), NULL);
    
    
    // Draw rounded rectangle bezier path
    UIBezierPath *roundedRectanglePath = [UIBezierPath bezierPathWithRoundedRect: CGRectMake(0, 0, width, height) cornerRadius: borderRadius];
    
    // Use the bezier as a clipping path
    [roundedRectanglePath addClip];
    
    // Use one of the two gradients depending on the state of the button
    CGGradientRef background = highlighted? highlightedGradient : gradient;
    
    // Draw gradient within the path
    CGContextDrawLinearGradient(context, background, CGPointMake(140, 0), CGPointMake(140, height-1), 0);
    
    // Draw border
    [borderColor setStroke];
    roundedRectanglePath.lineWidth = 2;
    [roundedRectanglePath stroke];
    
    // Draw Inner Glow
    UIBezierPath *innerGlowRect = [UIBezierPath bezierPathWithRoundedRect: CGRectMake(1.5, 1.5, width - 3, height - 3) cornerRadius: borderRadius * 4/5];
    [innerGlow setStroke];
    innerGlowRect.lineWidth = 1;
    [innerGlowRect stroke];
    
    // Output as Image
    UIImage* backgroundImage = UIGraphicsGetImageFromCurrentImageContext();
    
    // Cleanup
    UIGraphicsEndImageContext();
    CGGradientRelease(gradient);
    CGGradientRelease(highlightedGradient);
    CGColorSpaceRelease(colorSpace);
    
    return backgroundImage;
}

@end
