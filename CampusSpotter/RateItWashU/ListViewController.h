//
//  CategoriesViewController.h
//  RateItWashU
//
//  Created by Matt Bullock on 4/7/14.
//
//

#import <UIKit/UIKit.h>
#import "MainTabBarController.h"
#import <Parse/Parse.h>

@interface ListViewController : UITableViewController <UpdateListener>

@property NSArray *places;

@end
