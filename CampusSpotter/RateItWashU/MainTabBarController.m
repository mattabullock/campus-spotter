//
//  CustomTabBarController.m
//  RateItWashU
//
//  Created by Matt Bullock on 4/16/14.
//
//

#import "MainTabBarController.h"
#import "MapViewController.h"
#import <Parse/Parse.h>

@interface MainTabBarController ()

@end

@implementation MainTabBarController

@synthesize categories;
@synthesize actionSheet;
@synthesize places;
@synthesize favorites;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    actionSheet = [[UIActionSheet alloc] initWithTitle:@"Categories" delegate:self cancelButtonTitle:@"Cancel" destructiveButtonTitle:nil otherButtonTitles:@"Bathrooms", @"Food", @"Study Spots",nil];
    categories = [[NSArray alloc] initWithObjects:@"Bathrooms",@"Food",@"Study Spots", nil];
    [actionSheet setBounds:CGRectMake(0,0,320, 610)];
	PFQuery *query = [PFQuery queryWithClassName:@"Item"];
    [query whereKey:@"CategoryNumber" equalTo:@1];
    [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
        if (!error) {
            // The find succeeded.
            NSLog(@"Successfully retrieved %lu places.", (unsigned long)objects.count);
            places = objects;
            [self sendUpdate];
        } else {
            // Log details of the failure
            NSLog(@"Error: %@ %@", error, [error userInfo]);
        }
    }];
    
    PFQuery *favQuery = [PFQuery queryWithClassName:@"User"];
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex {
    PFQuery *query = [PFQuery queryWithClassName:@"Item"];
    if(buttonIndex == 0) {
        [query whereKey:@"CategoryNumber" equalTo:@1]; //bathroom
        MapViewController *mapViewC = [[self viewControllers] objectAtIndex:1];
        [mapViewC.selectedInfoWindow removeFromSuperview];
    } else if(buttonIndex == 1) {
        [query whereKey:@"CategoryNumber" equalTo:@2]; //food
        MapViewController *mapViewC = [[self viewControllers] objectAtIndex:1];
        [mapViewC.selectedInfoWindow removeFromSuperview];
    } else if(buttonIndex == 2) {
        [query whereKey:@"CategoryNumber" equalTo:@3]; //study spot
        MapViewController *mapViewC = [[self viewControllers] objectAtIndex:1];
        [mapViewC.selectedInfoWindow removeFromSuperview];
    } else { //
        return;
    }
    [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
        if (!error) {
            // The find succeeded.
            NSLog(@"Successfully retrieved %lu places.", (unsigned long)objects.count);
            places = objects;
            [self sendUpdate];
        } else {
            // Log details of the failure
            NSLog(@"Error: %@ %@", error, [error userInfo]);
        }
    }];
    
}

- (void) sendUpdate {
    NSLog(@"i hate you all");
    id <UpdateListener> lvc = [[self viewControllers] objectAtIndex:0];
    if ([lvc conformsToProtocol:@protocol(UpdateListener)]) {
        [lvc changeCategory];
    }
    id <UpdateListener> mvc = [[self viewControllers] objectAtIndex:1];
    if ([mvc conformsToProtocol:@protocol(UpdateListener)]) {
        [mvc changeCategory];
    }
}
- (IBAction)chooseCategory:(id)sender {
    [actionSheet showInView:self.view];
}

@end
