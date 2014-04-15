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
    PFQuery *query = [PFQuery queryWithClassName:@"Item"];
    [query whereKey:@"Title" equalTo:@"Brookings"];
    NSArray * objects = [query findObjects];
    
            
            // The find succeeded.
            NSLog(@"Successfully retrieved %d objects.", objects.count);
            // Do something with the found objects
            for (PFObject *object in objects) {
                item = object;
            }
            
            NSData *imageData = UIImagePNGRepresentation([UIImage imageNamed:@"Whispers-hero.jpg"]);
            PFFile *imageFile = [PFFile fileWithName:@"image.png" data:imageData];
            item[@"MainPhoto"] = imageFile;
            [item saveInBackground];
            
            //TEST
            PFObject *testObject = [PFObject objectWithClassName:@"Comment"];
            testObject[@"user"] = [PFUser currentUser];
            testObject[@"comment"] = @"Test Comment";
            testObject[@"rating"] = @5;
            testObject[@"item"] = item;
            [testObject saveInBackground];


	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
