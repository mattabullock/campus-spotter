//
//  RegistrationViewController.m
//  RateItWashU
//
//  Created by Matt Bullock on 4/7/14.
//
//

#import "RegistrationViewController.h"
#import <Parse/Parse.h>

@interface RegistrationViewController ()

@end

@implementation RegistrationViewController

@synthesize username,password;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}
- (IBAction)register:(id)sender {
    PFUser *user = [PFUser user];
    user.username = [username text];
    user.password = [password text];
    if([user signUp]) {
        [self performSegueWithIdentifier:@"registertonav" sender:self];
    }
}

- (void)viewDidLoad
{
    [self.navigationController setNavigationBarHidden:NO];
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
