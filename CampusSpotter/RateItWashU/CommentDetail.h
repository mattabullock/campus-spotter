//
//  CommentDetail.h
//  RateItWashU
//
//  Created by Parker Crist on 4/16/14.
//
//

#import <UIKit/UIKit.h>

@interface CommentDetail : UIViewController {
    NSString * author;
    NSString * comment;
    NSString * commentTitle;
    int rating;
}

@property NSString * author;
@property NSString * comment;
@property NSString * commentTitle;
@property int rating;
@property (weak, nonatomic) IBOutlet UILabel *authorLabel;
@property (weak, nonatomic) IBOutlet UIImageView *star1;
@property (weak, nonatomic) IBOutlet UIImageView *star2;
@property (weak, nonatomic) IBOutlet UIImageView *star3;
@property (weak, nonatomic) IBOutlet UIImageView *star4;
@property (weak, nonatomic) IBOutlet UIImageView *star5;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *commentLabel;

@end