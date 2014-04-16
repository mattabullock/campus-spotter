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
    PFObject * item;
    NSArray * comments;
}
@property PFObject * item;
@property NSArray * comments;
@end
