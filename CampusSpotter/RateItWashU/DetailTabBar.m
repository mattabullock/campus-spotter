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
        fave = false;
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.tabBar.tintColor = [UIColor colorWithRed:159/255.0f green:238/255.0f blue:0/255.0f alpha:1.0f];
    [self updateContent];
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
            if (!fave) {
                [faves addObject:item];
                [addToFavs setImage:[UIImage imageNamed:@"starOn.png"] forState:UIControlStateNormal];
            }
            else {
                PFObject * toRemove;
                for (PFObject * obj in faves) {
                    if ([[obj objectId] isEqualToString:[item objectId]]) {
                        toRemove = obj;
                    }
                }
                [faves removeObject: toRemove];
                [addToFavs setImage:[UIImage imageNamed:@"starOff.png"] forState:UIControlStateNormal];
            }
            object[@"Favorites"] = faves;
            [object saveInBackground];
            fave = !fave;
        }
    }];
}

- (void) updateContent {
    PFQuery *query2 = [PFQuery queryWithClassName:@"Comment"];
    [query2 whereKey:@"item" equalTo:item];
    comments = [query2 findObjects];
    
    
    PFQuery *favQuery = [PFUser query];
    [favQuery whereKey:@"username" equalTo:[[PFUser currentUser] username]];
    [favQuery getFirstObjectInBackgroundWithBlock:^(PFObject *object, NSError *error) {
        if (!error) {
            NSMutableArray * faves = (NSMutableArray *)object[@"Favorites"];
            if (faves != nil) {
                for (PFObject * obj in faves) {
                    if ([[obj objectId] isEqualToString:[item objectId]]) {
                        fave = true;
                        [addToFavs setImage:[UIImage imageNamed:@"starOn.png"] forState:UIControlStateNormal];
                    }
                }
            }
        }
    }];
}

@end
