//
//  InfoWindow.h
//  RateItWashU
//
//  Created by Matt Bullock on 4/16/14.
//
//

#import <Foundation/Foundation.h>

@interface InfoWindow : UIView

@property (weak, nonatomic) IBOutlet UIButton *details;
@property (weak, nonatomic) IBOutlet UIButton *directions;
@property (weak, nonatomic) IBOutlet UILabel  *name;
@property (weak, nonatomic) IBOutlet UIImageView *star1;
@property (weak, nonatomic) IBOutlet UIImageView *star2;
@property (weak, nonatomic) IBOutlet UIImageView *star3;
@property (weak, nonatomic) IBOutlet UIImageView *star4;
@property (weak, nonatomic) IBOutlet UIImageView *star5;

@end
