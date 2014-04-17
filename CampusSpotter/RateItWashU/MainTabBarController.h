//
//  CustomTabBarController.h
//  RateItWashU
//
//  Created by Matt Bullock on 4/16/14.
//
//

#import <UIKit/UIKit.h>

@interface MainTabBarController : UITabBarController <UIActionSheetDelegate>

@property (strong,nonatomic) NSArray *categories;
@property (strong,nonatomic) UIActionSheet *actionSheet;

@end
