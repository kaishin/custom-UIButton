# Custom UIButton

A demo app showcasing the various methods of customizing a UIButton. Requires Xcode 4.5 and iOS 6. For more deatils, check out the accompanying blog post.

## modifications by kluivers

 - CoreGraphics is not used, removed unnecessary `- (void) drawRect:(CGRect)rect`
 - no custom event handling, uses `-(void)setHighlighted:(BOOL)highlighted` instead
 - disabled implicit animations

Initialisation of layers now happens in - (id) initWithCoder:(NSCoder *)decoder, which is called after deserialization from a xib/storyboard. If you want to create the CBLayer in code another initialiser has to be added.

Layer creating is kept intact and exactly the same as the original implementation.
