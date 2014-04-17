//
//  ViewController.m
//  RateItWashU
//
//  Created by Matt Bullock on 4/7/14.
//
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

@synthesize username,password,loginbtn,registerbtn;

- (void)viewDidLoad
{
    [self.navigationController setNavigationBarHidden:YES];
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]
                                   initWithTarget:self
                                   action:@selector(dismissKeyboard)];
    
    [self.view addGestureRecognizer:tap];
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)viewDidAppear:(BOOL)animated {
    PFUser *user = [PFUser currentUser];
    if (user.username != nil) {
        [self performSegueWithIdentifier:@"login" sender:self];
    }
}

-(void)dismissKeyboard {
    [username resignFirstResponder];
    [password resignFirstResponder];
}

- (IBAction)submitClicked:(id)sender {
    [PFUser logInWithUsernameInBackground:username.text password:password.text
        block:^(PFUser *user, NSError *error) {
            if(user) {
                [self performSegueWithIdentifier:@"login" sender:self];
                NSLog(@"logged in!");
            } else {
                // The login failed. Check error to see why.
            }
        }];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
