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

-(void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
    CGPoint touchPoint = [[touches anyObject] locationInView:self];
    
    if (CGRectContainsPoint(self.bounds, touchPoint))
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

    
    // Draw Rounded Rectangle
    UIBezierPath *roundedRectanglePath = [UIBezierPath bezierPathWithRoundedRect: CGRectMake(0, 0, 280, 37) cornerRadius: 4];
    CGContextSaveGState(context);
    [roundedRectanglePath addClip];
    CGGradientRef background = _tapped? highlightedGradient : gradient;
    
    CGContextDrawLinearGradient(context, background, CGPointMake(140, 0), CGPointMake(140, 37), 0);
    [borderColor setStroke];
    roundedRectanglePath.lineWidth = 2;
    [roundedRectanglePath stroke];
    CGContextRestoreGState(context);
    
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
