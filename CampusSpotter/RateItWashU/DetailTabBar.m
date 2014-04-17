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
//    PFQuery *query = [PFQuery queryWithClassName:@"Item"];
//    [query whereKey:@"Title" equalTo:@"Brookings"];
//    NSArray * objects = [query findObjects];
//    
//            
//            // The find succeeded.
//            NSLog(@"Successfully retrieved %lu objects.", (unsigned long)objects.count);
//            // Do something with the found objects
//            for (PFObject *object in objects) {
//                item = object;
//            }
//            
//            NSData *imageData = UIImagePNGRepresentation([UIImage imageNamed:@"Whispers-hero.jpg"]);
//            PFFile *imageFile = [PFFile fileWithName:@"image.png" data:imageData];
//            item[@"MainPhoto"] = imageFile;
//            [item saveInBackground];
    
    
            PFQuery *query2 = [PFQuery queryWithClassName:@"Comment"];
            [query2 whereKey:@"item" equalTo:item];
            comments = [query2 findObjects];


	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
