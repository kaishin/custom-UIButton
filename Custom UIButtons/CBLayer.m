#import "CBLayer.h"

@interface CBLayer ()

@property (assign,nonatomic) BOOL setupLayers;
@property (strong,nonatomic) CAGradientLayer *backgroundLayer, *highlightBackgroundLayer;
@property (strong,nonatomic) CALayer *innerGlow;

@end

@implementation CBLayer

#pragma mark - UIButton Overrides

+ (CBLayer *)buttonWithType:(UIButtonType)type
{
    return [super buttonWithType:UIButtonTypeCustom];
}

#pragma mark - Touch event overrides

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    // Set property
    _tapped = YES;
    
    // Force drawRect to be called (NEVER, EVER call drawRect directly)
    [self setNeedsDisplay];
    
    // Superclass implementation
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

#pragma mark -

- (void)drawRect:(CGRect)rect
{
    if (!_setupLayers)
    {
        [self drawButton];
        [self drawInnerGlow];
        [self drawBackgroundLayer];
        [self drawHighlightBackgroundLayer];
    }
    
    // Hide and show the highlighted background (inverted gradient)
    if (_tapped)
    {
        _highlightBackgroundLayer.hidden = NO;
    }
    
    else
    {
        _highlightBackgroundLayer.hidden = YES;
    }
    
    _setupLayers = YES;
}

#pragma mark - Layer setters

- (void)drawButton
{
    // Get the root layer (any UIView subclass comes with one) 
    CALayer *layer = self.layer;
    
    // Make the root layer act as a mask for all sublayers
    layer.masksToBounds = YES; 
    
    layer.cornerRadius = 4.5f;
    layer.borderWidth = 1;
    layer.borderColor = [UIColor colorWithRed:0.77f green:0.43f blue:0.00f alpha:1.00f].CGColor;
}

- (void)drawBackgroundLayer
{
    // Check if the property has been set already
    if (!_backgroundLayer)
    {
        // Instantiate the gradient layer
        _backgroundLayer = [CAGradientLayer layer];
        
        // Set the gradient frame (make the gradient fill the whole button)
        _backgroundLayer.frame = self.bounds;
        
        // Set the colors
        _backgroundLayer.colors = (@[
                                   (id)[UIColor colorWithRed:0.94f green:0.82f blue:0.52f alpha:1.00f].CGColor,
                                   (id)[UIColor colorWithRed:0.91f green:0.55f blue:0.00f alpha:1.00f].CGColor
                                   
                                   
                                   ]);
        
        // Set the stops
        _backgroundLayer.locations = (@[
                                      @0.0f,
                                      @1.0f
                                      ]);
        
        // Add the gradient to the layer hierarchy
        [self.layer insertSublayer:_backgroundLayer atIndex:0];
    }
}

- (void)drawHighlightBackgroundLayer
{
    if (!_highlightBackgroundLayer)
    {
        _highlightBackgroundLayer = [CAGradientLayer layer];
        _highlightBackgroundLayer.frame = self.bounds;
        _highlightBackgroundLayer.colors = (@[
                           (id)[UIColor colorWithRed:0.91f green:0.55f blue:0.00f alpha:1.00f].CGColor,
                           (id)[UIColor colorWithRed:0.94f green:0.82f blue:0.52f alpha:1.00f].CGColor
                           ]);
        _highlightBackgroundLayer.locations = (@[
                              @0.0f,
                              @1.0f
                              ]);
        [self.layer insertSublayer:_highlightBackgroundLayer atIndex:1];
    }
}

- (void)drawInnerGlow
{
    if (!_innerGlow)
    {
        // Instantiate the innerGlow layer
        _innerGlow = [CALayer layer];
        
        // Set the frame (1pt inset)
        CGRect innerGlowFrame = CGRectInset(self.bounds, 1, 1);
        _innerGlow.frame = innerGlowFrame;
        
        _innerGlow.cornerRadius= 4.5f;
        _innerGlow.borderWidth = 1;
        _innerGlow.borderColor = [[UIColor whiteColor] CGColor];
        _innerGlow.opacity = 0.5;
        
        [self.layer insertSublayer:_innerGlow atIndex:2];
    }
}

@end
