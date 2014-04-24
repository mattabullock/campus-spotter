//
//  DetailTabBar.h
//  RateItWashU
//
//  Created by Parker Crist on 4/14/14.
//
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>

@interface DetailTabBar : UITabBarController
@property (strong,nonatomic) PFObject *item;
@property (strong,nonatomic) NSArray *comments;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *addToFavs;
@property (strong,nonatomic) NSString *test;
@end
