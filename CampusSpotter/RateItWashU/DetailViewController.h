//
//  DetailViewController.h
//  RateItWashU
//
//  Created by Matt Bullock on 4/8/14.
//
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>
#import "DetailTabBar.h"

@interface DetailViewController : UIViewController {
    PFObject * item;
    NSArray * stars;
    UIPageViewController * pvc;
}
@property PFObject * item;
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UITableView *comments;
@property (weak, nonatomic) IBOutlet UIImageView *star1;
@property (weak, nonatomic) IBOutlet UIImageView *star2;
@property (weak, nonatomic) IBOutlet UIImageView *star3;
@property (weak, nonatomic) IBOutlet UIImageView *star4;
@property (weak, nonatomic) IBOutlet UIImageView *star5;

@end
