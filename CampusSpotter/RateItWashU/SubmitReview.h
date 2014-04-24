//
//  SubmitReview.h
//  RateItWashU
//
//  Created by Parker Crist on 4/15/14.
//
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>
#import "DetailTabBar.h"

@interface SubmitReview : UIViewController {
    int currentRating;
    PFFile * uploadedImage;
}
@property (weak, nonatomic) IBOutlet UIButton *star1;
@property (weak, nonatomic) IBOutlet UIButton *star2;
@property (weak, nonatomic) IBOutlet UIButton *star3;
@property (weak, nonatomic) IBOutlet UIButton *star4;
@property (weak, nonatomic) IBOutlet UIButton *star5;

@property (weak, nonatomic) IBOutlet UITextView *comment;
@property (weak, nonatomic) IBOutlet UIButton *submit;
@property (weak, nonatomic) IBOutlet UITextField *commentTitle;



@end
