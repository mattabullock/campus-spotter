//
//  DetailViewController.m
//  RateItWashU
//
//  Created by Matt Bullock on 4/8/14.
//
//

#import "DetailViewController.h"

@interface DetailViewController ()

@end

@implementation DetailViewController
@synthesize item;
@synthesize imageView;
@synthesize star1, star2, star3, star4, star5;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];// Custom initialization
    stars = [[NSArray alloc] initWithObjects:star1, star2, star3, star4, star5, nil];

    DetailTabBar * parent = (DetailTabBar *)self.tabBarController;
    item = [parent item];
    [self updateDisplay];
    imageView.contentMode = UIViewContentModeScaleAspectFit;
    [self.tabBarItem setTitle: @"Details"];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)updateDisplay {
    [self.parentViewController.navigationItem setTitle:item[@"Title"]];
    PFFile *userImageFile = item[@"MainPhoto"];
    [userImageFile getDataInBackgroundWithBlock:^(NSData *imageData, NSError *error) {
        if (!error) {
            UIImage *image = [UIImage imageWithData:imageData];
            [imageView setImage: image];
        }
    }];
    
    //Calculate average rating
    DetailTabBar * parent = (DetailTabBar *)self.tabBarController;
    NSArray * comments = [parent comments];
    int avgRating = 0;
    for (PFObject * comment in comments) {
        avgRating += [comment[@"rating"] intValue];
    }
    if(comments.count > 0) {
        avgRating = avgRating/comments.count;
    } else {
        avgRating = 0;
    }
    NSLog(@"Avg rating: %d", avgRating);
    for (int i = 0; i < 5; i++) {
        UIImageView * currentStar = [stars objectAtIndex:i];
        currentStar.image = [UIImage imageNamed:@"starOff.png"];
        if (avgRating >= (i+1)) {
            currentStar.image = [UIImage imageNamed:@"starOn.png"];
        }
    }
    
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

@end
