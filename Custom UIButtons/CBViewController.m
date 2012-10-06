#import "CBViewController.h"

@interface CBViewController ()

@property (weak, nonatomic) IBOutlet UIButton *fullSizeImage;
@property (weak, nonatomic) IBOutlet UIButton *resizableImage;

@end

@implementation CBViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // Set full-sized background image
	[self.fullSizeImage setBackgroundImage:[UIImage imageNamed:@"button.png"] forState:UIControlStateNormal];
    [self.fullSizeImage setBackgroundImage:[UIImage imageNamed:@"buttonHighlighted.png"] forState:UIControlStateHighlighted];
    
    // Define resizable images
    UIImage *resizableButton = [[UIImage imageNamed:@"resizableButton.png" ] resizableImageWithCapInsets:UIEdgeInsetsMake(17, 5, 17, 5)];
    UIImage *resizableButtonHighlighted = [[UIImage imageNamed:@"resizableButtonHighlighted.png" ] resizableImageWithCapInsets:UIEdgeInsetsMake(17, 5, 17, 5)];
    
    // Set resizable background image
    [self.resizableImage setBackgroundImage:resizableButton forState:UIControlStateNormal];
    [self.resizableImage setBackgroundImage:resizableButtonHighlighted forState:UIControlStateHighlighted];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
