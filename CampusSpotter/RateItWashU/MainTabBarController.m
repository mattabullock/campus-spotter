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
        // fill in things here as needed
    }
    return self;
}

- (void)viewDidLoad
{
    categories = [[NSArray alloc] initWithObjects:@"Bathrooms",@"Food",@"Study Spots", @"Landmarks",@"Dorms", nil];
    actionSheet = [[UIActionSheet alloc] initWithTitle:@"Categories"
                                              delegate:self cancelButtonTitle:nil
                                destructiveButtonTitle:nil
                                     otherButtonTitles:nil];
    for (NSString* category in categories) {
        [actionSheet addButtonWithTitle:category];
    }
    [actionSheet addButtonWithTitle:@"Cancel"];
    actionSheet.cancelButtonIndex = [categories count];
    [actionSheet setBounds:CGRectMake(0,0,320, 610)];
	PFQuery *query = [PFQuery queryWithClassName:@"Item"];
    [query whereKey:@"CategoryNumber" equalTo:@1];
    [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
        if (!error) {
            // The find succeeded.
            NSLog(@"Places -- successfully retrieved %lu places.", (unsigned long)objects.count);
            places = objects;
            [self sendUpdate];
        } else {
            // Log details of the failure
            NSLog(@"Error: %@ %@", error, [error userInfo]);
        }
    }];
    
    PFQuery *favQuery = [PFUser query];
    [favQuery includeKey:@"Favorites"];
    [favQuery whereKey:@"username" equalTo:[[PFUser currentUser] username]];
    [favQuery findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
        if (!error) {
            // The find succeeded.
            NSLog(@"Favorites -- successfully retrieved %lu places.", (unsigned long)objects.count);
            favorites = objects[0][@"Favorites"];
        } else {
            // Log details of the failure
            NSLog(@"Error: %@ %@", error, [error userInfo]);
        }
    }];
    
    [[UITabBarItem appearance] setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor colorWithRed:219/255.0f green:219/255.0f blue:219/255.0f alpha:1.0f] } forState:UIControlStateNormal];
    [[UITabBarItem appearance] setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor colorWithRed:159/255.0f green:238/255.0f blue:0/255.0f alpha:1.0f] } forState:UIControlStateSelected];
    self.tabBar.tintColor = [UIColor colorWithRed:159/255.0f green:238/255.0f blue:0/255.0f alpha:1.0f];
    
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
    if(buttonIndex < categories.count) {
        [query whereKey:@"CategoryNumber" equalTo:@(buttonIndex)];
        MapViewController *mapViewC = [[self viewControllers] objectAtIndex:1];
        [mapViewC.selectedInfoWindow removeFromSuperview];
    } else {
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
