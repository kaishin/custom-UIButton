#import "CBBezier.h"

@implementation CBBezier

#pragma mark - UIButton Overrides

+ (CBBezier *)buttonWithType:(UIButtonType)type
{
    return [super buttonWithType:UIButtonTypeCustom];
}

#pragma mark - Touch event overrides

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    _tapped = YES;
    [self setNeedsDisplay];
    [super touchesBegan:touches withEvent:event];
}

-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    _tapped = NO;
    [self setNeedsDisplay];
    [super touchesEnded:touches withEvent:event];
}

// The distance from the button beyond which the former should no longer be considered tapped
static CGFloat touchDistance = 70;

-(void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
    // Get the distance between the touch point and the button bounds
    CGPoint touchPoint = [[touches anyObject] locationInView:self];
    
    // Define the touch area frame using the touch distance defined above
    CGRect touchArea = CGRectMake(0, - touchDistance, CGRectGetWidth(self.frame), CGRectGetHeight(self.frame) + touchDistance * 2);
    
    if (CGRectContainsPoint(touchArea, touchPoint))
    {
        _tapped = YES;
        [self setNeedsDisplay];
    }
    
    else
    {
        _tapped = NO;
        [self setNeedsDisplay];
    }
    
    [super touchesMoved:touches withEvent:event];
}

- (void)drawRect:(CGRect)rect
{
    // General Declarations
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    CGContextRef context = UIGraphicsGetCurrentContext();
    
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
    UIBezierPath *roundedRectanglePath = [UIBezierPath bezierPathWithRoundedRect: CGRectMake(0, 0, 280, 37) cornerRadius: 4];
    // Use the bezier as a clipping path
    [roundedRectanglePath addClip];
    
    // Use one of the two gradients depending on the state of the button
    CGGradientRef background = _tapped? highlightedGradient : gradient;
    
    // Draw gradient within the path
    CGContextDrawLinearGradient(context, background, CGPointMake(140, 0), CGPointMake(140, 37), 0);
    
    // Draw border
    [borderColor setStroke];
    roundedRectanglePath.lineWidth = 2;
    [roundedRectanglePath stroke];
    
    // Draw Inner Glow
    UIBezierPath *innerGlowRect = [UIBezierPath bezierPathWithRoundedRect: CGRectMake(1.5, 1.5, 277, 34) cornerRadius: 2.5];
    [innerGlow setStroke];
    innerGlowRect.lineWidth = 1;
    [innerGlowRect stroke];

    // Cleanup
    CGGradientRelease(gradient);
    CGGradientRelease(highlightedGradient);
    CGColorSpaceRelease(colorSpace);
}

@end
