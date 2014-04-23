//
//  CustomTabBarController.h
//  RateItWashU
//
//  Created by Matt Bullock on 4/16/14.
//
//

#import <UIKit/UIKit.h>

@protocol UpdateListener <NSObject>
    -(void)changeCategory;
@end

@interface MainTabBarController : UITabBarController <UIActionSheetDelegate>

@property (strong,nonatomic) NSArray *categories;
@property (strong,nonatomic) UIActionSheet *actionSheet;
@property (strong,nonatomic) NSArray *places;
@property (strong,nonatomic) NSArray *favorites;

@end
