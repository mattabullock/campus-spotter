//
//  FavoritesViewController.h
//  RateItWashU
//
//  Created by Matt Bullock on 4/23/14.
//
//

#import "DetailTabBar.h"
#import <UIKit/UIKit.h>
#import "MainTabBarController.h"
#import <Parse/Parse.h>
#import "PFCell.h"

@interface FavoritesViewController : UITableViewController <UpdateListener>

@property PFCell *clickedCell;
@property NSMutableArray *favorites;

@end
