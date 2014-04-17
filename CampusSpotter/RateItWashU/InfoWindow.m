//
//  InfoWindow.m
//  RateItWashU
//
//  Created by Matt Bullock on 4/16/14.
//
//

#import "InfoWindow.h"

@implementation InfoWindow

@synthesize star1,star2,star3,star4,star5;
@synthesize data;

- (void)awakeFromNib
{
    stars = [[NSArray alloc] initWithObjects:star1, star2, star3, star4, star5, nil];
}

- (void)getRating
{
    PFQuery *query2 = [PFQuery queryWithClassName:@"Comment"];
    [query2 whereKey:@"item" equalTo:data];
    NSArray* comments = [query2 findObjects];
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

@end
