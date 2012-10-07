#import "CBLayer.h"

@interface CBLayer ()

@property (assign, nonatomic) BOOL setupLayers;
@end

@implementation CBLayer

#pragma mark -

- (void)drawRect:(CGRect)rect
{
    if (!_setupLayers)
    {
        [self drawBorder];
        [self drawInnerGlow];
        [self drawBackgroundGradient];
        [self drawHighlightedBackgroundGradient];
    }

    CAGradientLayer *highlightLayer = [self.layer.sublayers objectAtIndex:1];

    if (_tapped)
    {
        highlightLayer.hidden = NO;
    }
    
    else
    {
        highlightLayer.hidden = YES;
    }
    
    _setupLayers = YES;
}

- (void)drawBackgroundGradient
{
    CAGradientLayer *gradient = [CAGradientLayer layer];
    gradient.frame = self.bounds;
    gradient.colors = (@[
                       (id)[UIColor colorWithRed:0.94f green:0.82f blue:0.52f alpha:1.00f].CGColor,
                       (id)[UIColor colorWithRed:0.91f green:0.58f blue:0.00f alpha:1.00f].CGColor
                       ]);
    gradient.locations = (@[
                          @0.0f,
                          @1.0f
                          ]);
    
    [self.layer insertSublayer:gradient atIndex:0];
}

- (void)drawHighlightedBackgroundGradient
{
    CAGradientLayer *gradient = [CAGradientLayer layer];
    gradient.frame = self.bounds;
    gradient.colors = (@[
                       (id)[UIColor colorWithRed:0.91f green:0.58f blue:0.00f alpha:1.00f].CGColor,
                       (id)[UIColor colorWithRed:0.94f green:0.82f blue:0.52f alpha:1.00f].CGColor
                       ]);
    gradient.locations = (@[
                          @0.0f,
                          @1.0f
                          ]);

    [self.layer insertSublayer:gradient atIndex:1];
}

- (void)drawInnerGlow
{
    CALayer *innerglow = [CALayer layer];
    CGRect innerGlowFrame = CGRectMake(self.bounds.origin.x+1, self.bounds.origin.y+1, self.bounds.size.width-2, self.bounds.size.height-2);
    innerglow.frame = innerGlowFrame;
    innerglow.cornerRadius= 4.5f;
    innerglow.borderWidth = 1;
    innerglow.borderColor = [[UIColor whiteColor] CGColor];
    innerglow.opacity = 0.5;
    
    [self.layer insertSublayer:innerglow atIndex:2];
}

- (void)drawBorder
{
    self.layer.cornerRadius = 4.5f;
    self.layer.masksToBounds = YES;
    self.layer.borderWidth = 1;
    self.layer.borderColor = [UIColor colorWithRed:0.77f green:0.43f blue:0.00f alpha:1.00f].CGColor;
}

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
    CGRect testRect = CGRectMake(0, 0, self.frame.size.width, self.frame.size.height);
    
    if (CGRectContainsPoint(testRect, touchPoint))
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

@end
