//
//  UserUploadViewController.h
//  RateItWashU
//
//  Created by Matt Bullock on 4/23/14.
//
//

#import "ViewController.h"

@interface UserUploadViewController : UIViewController

@property (strong, nonatomic) IBOutlet UITextField *name;
@property (strong, nonatomic) IBOutlet UIPickerView *category;
@property (strong, nonatomic) IBOutlet UIButton *photos;
@property (strong, nonatomic) IBOutlet UIButton *submit;


@end
