//
//  DetailTabBar.m
//  RateItWashU
//
//  Created by Parker Crist on 4/14/14.
//
//

#import "DetailTabBar.h"

@interface DetailTabBar ()

@end

@implementation DetailTabBar
@synthesize item;
@synthesize comments;
@synthesize addToFavs;

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
    [super viewDidLoad];
    NSLog(@"%@",(NSString*)item[@"Title"]);
    
    
    PFQuery *query2 = [PFQuery queryWithClassName:@"Comment"];
    [query2 whereKey:@"item" equalTo:item];
    comments = [query2 findObjects];
    
    
    PFQuery *favQuery = [PFUser query];
    [favQuery whereKey:@"username" equalTo:[[PFUser currentUser] username]];
    [favQuery getFirstObjectInBackgroundWithBlock:^(PFObject *object, NSError *error) {
        if (!error) {
            NSMutableArray * faves = (NSMutableArray *)object[@"Favorites"];
            NSLog(@"%d", faves.count);
            NSLog(@"%@", faves);
            if (faves != nil && [faves containsObject:item]) {
                NSLog(@"changing pic");
                [addToFavs setImage:[UIImage imageNamed:@"starOn.png"]];
            }
        }
    }];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)favesClicked:(id)sender {
    PFQuery *favQuery = [PFUser query];
    [favQuery whereKey:@"username" equalTo:[[PFUser currentUser] username]];
    [favQuery getFirstObjectInBackgroundWithBlock:^(PFObject *object, NSError *error) {
        if (!error) {
            NSMutableArray * faves = object[@"Favorites"];
            if (faves == nil) {
                faves = [[NSMutableArray alloc] init];
            }
            [faves addObject:item];
            object[@"Favorites"] = faves;
            [object saveInBackground];
        }
    }];
    
   
}

@end
