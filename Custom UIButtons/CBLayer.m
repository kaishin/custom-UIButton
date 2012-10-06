#import "CBLayer.h"

@interface CBLayer ()

@end

@implementation CBLayer

#pragma mark -
- (void)awakeFromNib
{
    
}

- (void)drawRect:(CGRect)rect
{
    [self drawBorder];
    [self drawInnerGlow];
    [self drawBackgroundGradient];
}

- (void)drawBackgroundGradient
{
    // Instantiate the gradient layer
    CAGradientLayer *gradient = [CAGradientLayer layer];
    
    // Set the gradient frame (make the gradient fill the whole button)
    gradient.frame = self.bounds;
    
    
    // Set the colors
    gradient.colors = (@[
                       (id)[UIColor colorWithRed:0.94f green:0.82f blue:0.52f alpha:1.00f].CGColor,
                       (id)[UIColor colorWithRed:0.91f green:0.58f blue:0.00f alpha:1.00f].CGColor
                       ]);
    
    // Set the stops
    gradient.locations = (@[
                          @0.0f,
                          @1.0f
                          ]);
    
    // Add the gradient to the layer hierarchy
    [self.layer insertSublayer:gradient atIndex:0];
}

- (void)drawBackgroundGradientHighlighted
{
    // Instantiate the gradient layer
    CAGradientLayer *gradient = [CAGradientLayer layer];
    
    // Set the gradient frame (make the gradient fill the whole button)
    gradient.frame = self.bounds;
    
    // Set the colors
    gradient.colors = (@[
                       (id)[UIColor colorWithRed:0.3f green:0.82f blue:0.52f alpha:1.00f].CGColor,
                       (id)[UIColor colorWithRed:0.91f green:0.58f blue:0.00f alpha:1.00f].CGColor
                       ]);
    
    // Set the stops
    gradient.locations = (@[
                          @0.0f,
                          @1.0f
                          ]);
    //gradient.hidden = Yes;
    
    // Add the gradient to the layer hierarchy
    [self.layer insertSublayer:gradient atIndex:0];
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
    
    [self.layer insertSublayer:innerglow atIndex:1];
}

- (void)drawBorder
{
    self.layer.cornerRadius = 4.5f;
    self.layer.masksToBounds = YES;
    self.layer.borderWidth = 1;
    self.layer.borderColor = [UIColor colorWithRed:0.77f green:0.43f blue:0.00f alpha:1.00f].CGColor;
}

@end
