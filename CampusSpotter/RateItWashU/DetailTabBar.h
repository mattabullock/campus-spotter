//
//  DetailTabBar.h
//  RateItWashU
//
//  Created by Parker Crist on 4/14/14.
//
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>

@interface DetailTabBar : UITabBarController {
    BOOL fave;
}
@property (strong,nonatomic) PFObject *item;
@property (strong,nonatomic) NSArray *comments;
@property (weak, nonatomic) IBOutlet UIButton *addToFavs;
@property (strong,nonatomic) NSString *test;
@end
