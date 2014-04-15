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
}
@property PFObject * item;
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UITableView *comments;

@end
