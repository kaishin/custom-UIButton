#import "CBLayer.h"

@interface CBLayer ()

@property (assign, nonatomic) BOOL tapped, setupLayers;
@property (strong, nonatomic) CAGradientLayer *backgroundLayer, *highlightBackgroundLayer;
@property (strong,nonatomic) CALayer *innerGlow;

@end

@implementation CBLayer

#pragma mark - UIButton Overrides

+ (CBLayer *)buttonWithType:(UIButtonType)type
{
    return [super buttonWithType:UIButtonTypeCustom];
}

#pragma mark -

- (void)drawRect:(CGRect)rect
{
    if (!_setupLayers)
    {
        self.layer.cornerRadius = 4.5f;
        self.layer.masksToBounds = YES;
        self.layer.borderWidth = 1;
        self.layer.borderColor = [UIColor colorWithRed:0.77f green:0.43f blue:0.00f alpha:1.00f].CGColor;
        
        [self drawInnerGlow];
        [self drawBackgroundLayer];
        [self drawHighlightBackgroundLayer];
    }


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

- (void)drawBackgroundLayer
{
    if (!_backgroundLayer)
    {
        _backgroundLayer = [CAGradientLayer layer];
        _backgroundLayer.frame = self.bounds;
        _backgroundLayer.colors = (@[
                                   (id)[UIColor colorWithRed:0.94f green:0.82f blue:0.52f alpha:1.00f].CGColor,
                                   (id)[UIColor colorWithRed:0.91f green:0.58f blue:0.00f alpha:1.00f].CGColor
                                   ]);
        _backgroundLayer.locations = (@[
                                      @0.0f,
                                      @1.0f
                                      ]);
        
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
                           (id)[UIColor colorWithRed:0.91f green:0.58f blue:0.00f alpha:1.00f].CGColor,
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
        _innerGlow = [CALayer layer];
        CGRect innerGlowFrame = CGRectMake(self.bounds.origin.x+1, self.bounds.origin.y+1, self.bounds.size.width-2, self.bounds.size.height-2);
        _innerGlow.frame = innerGlowFrame;
        _innerGlow.cornerRadius= 4.5f;
        _innerGlow.borderWidth = 1;
        _innerGlow.borderColor = [[UIColor whiteColor] CGColor];
        _innerGlow.opacity = 0.5;
        
        [self.layer insertSublayer:_innerGlow atIndex:2];
    }
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

@end
