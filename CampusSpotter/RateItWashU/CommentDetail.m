//
//  CommentDetail.m
//  RateItWashU
//
//  Created by Parker Crist on 4/16/14.
//
//

#import "CommentDetail.h"

@interface CommentDetail ()

@end

@implementation CommentDetail
@synthesize image, imageView;
@synthesize author, comment, commentTitle;
@synthesize rating;
@synthesize commentLabel, titleLabel, authorLabel;
@synthesize star1, star2, star3, star4, star5;


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
    [authorLabel sizeToFit];
    [commentLabel sizeToFit];
    [titleLabel sizeToFit];
    commentLabel.numberOfLines = 0;
    titleLabel.numberOfLines = 0;
    authorLabel.text = [NSString stringWithFormat:@"Written by %@", author];
    titleLabel.text = commentTitle;
    imageView.contentMode = UIViewContentModeScaleAspectFit;
    
    
    star1.image = [UIImage imageNamed:@"starOff.png"];
    star2.image = [UIImage imageNamed:@"starOff.png"];
    star3.image = [UIImage imageNamed:@"starOff.png"];
    star4.image = [UIImage imageNamed:@"starOff.png"];
    star5.image = [UIImage imageNamed:@"starOff.png"];
    
    if (rating >= 1) {
        star1.image = [UIImage imageNamed:@"starOn.png"];
    }
    if (rating >= 2) {
        star2.image = [UIImage imageNamed:@"starOn.png"];
    }
    if (rating >= 3) {
        star3.image = [UIImage imageNamed:@"starOn.png"];
    }
    if (rating >= 4) {
        star4.image = [UIImage imageNamed:@"starOn.png"];
    }
    if (rating == 5) {
        star5.image = [UIImage imageNamed:@"starOn.png"];
    }
    
    
    commentLabel = [[UILabel alloc] initWithFrame: CGRectMake(imageView.frame.origin.x, imageView.frame.origin.y + imageView.frame.size.height + 8, imageView.frame.size.width, imageView.frame.size.height)];
    commentLabel.text = comment;
    commentLabel.numberOfLines = 0;
    
	//Display picture if possible
    [image getDataInBackgroundWithBlock:^(NSData *imageData, NSError *error) {
        if (!error) {
            NSLog(@"no error");
            UIImage *image2 = [UIImage imageWithData:imageData];
            [imageView setImage: image2];
        }
    }];

    if (image == nil) {
        commentLabel.frame = imageView.frame;
        NSLog(@"MOVING");
        [imageView setHidden:YES];
    }
    
    [commentLabel sizeToFit];
    [self.view addSubview:commentLabel];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
