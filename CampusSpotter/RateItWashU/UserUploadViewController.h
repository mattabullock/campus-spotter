//
//  UserUploadViewController.h
//  RateItWashU
//
//  Created by Matt Bullock on 4/23/14.
//
//

#import "ViewController.h"
#import <CoreLocation/CoreLocation.h>
#import <MobileCoreServices/MobileCoreServices.h>
#import "MainTabBarController.h"

@interface UserUploadViewController : UIViewController <UIPickerViewDataSource,
                                                        UIPickerViewDelegate,
                                                        UIImagePickerControllerDelegate,
                                                        UINavigationControllerDelegate>

@property(nonatomic,retain) CLLocationManager *locationManager;
@property (strong, nonatomic) IBOutlet UITextField *name;
@property (strong, nonatomic) IBOutlet UIPickerView *categoryPicker;
@property (strong, nonatomic) IBOutlet UIButton *photos;
@property (strong, nonatomic) IBOutlet UIButton *submit;
@property (strong, nonatomic) NSArray *categories;
@property (atomic) NSNumber *category;
@property (strong, nonatomic) PFFile *uploadImg;


@end
