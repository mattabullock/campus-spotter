//
//  ViewController.h
//  RateItWashU
//
//  Created by Matt Bullock on 4/7/14.
//
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>
#import "ListViewController.h"

@interface ViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITextField *username;
@property (weak, nonatomic) IBOutlet UITextField *password;
@property (weak, nonatomic) IBOutlet UIButton *loginbtn;
@property (weak, nonatomic) IBOutlet UIButton *registerbtn;

@end
