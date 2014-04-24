//
//  UserUploadViewController.m
//  RateItWashU
//
//  Created by Matt Bulloc/Users/Matt/Documents/projects/spotter/CampusSpotter/RateItWashU/UserUploadViewController.mk on 4/23/14.
//
//

#import "UserUploadViewController.h"

@interface UserUploadViewController ()

@end

@implementation UserUploadViewController

@synthesize categories;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]
                                   initWithTarget:self
                                   action:@selector(dismissKeyboard)];
    
    [self.view addGestureRecognizer:tap];
    categories = ((MainTabBarController*)self.tabBarController).categories;
    self.category = @1;
}

-(void)dismissKeyboard {
    [_name resignFirstResponder];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

// returns the number of 'columns' to display.
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 1;
}

// returns the # of rows in each component..
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent: (NSInteger)component
{
    return categories.count;
}

-(NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row   forComponent:(NSInteger)component
{
    
    return [categories objectAtIndex:row];
    
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row   inComponent:(NSInteger)component{
    self.category = @(row + 1);
}

-(void)imagePickerController:
(UIImagePickerController *)picker
didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    NSString *mediaType = info[UIImagePickerControllerMediaType];
    if ([mediaType isEqualToString:(NSString *)kUTTypeImage])
    {
        UIImage *tempImg = [info objectForKey:@"UIImagePickerControllerOriginalImage"];
        NSData *imageData = UIImageJPEGRepresentation(tempImg, 0.5f);
        PFFile *imageFile = [PFFile fileWithName:@"Image.jpg" data:imageData];
        self.uploadImg = imageFile;
    }
    // Code here to work with media
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)choosePhotoBtn:(id)sender {
    UIImagePickerController *imagePickerController = [[UIImagePickerController alloc] init];
    imagePickerController.modalPresentationStyle = UIModalPresentationCurrentContext;
    imagePickerController.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    imagePickerController.delegate = self;
    imagePickerController.mediaTypes = @[(NSString *) kUTTypeImage,
                               (NSString *) kUTTypeMovie];
    [self presentViewController:imagePickerController animated:YES completion:nil];
}

- (IBAction)submit:(id)sender {
    PFGeoPoint *geo = [PFGeoPoint geoPointWithLocation:self.locationManager.location];
    NSLog(@"%@", geo);
    NSLog(@"%@", self.name.text);
    NSLog(@"%@", self.category);
    NSLog(@"%@", self.uploadImg);
    PFObject *submission = [PFObject objectWithClassName:@"Item"];
    submission[@"CategoryNumber"] = self.category;
    submission[@"Location"] = geo;
    submission[@"Title"] = self.name.text;
    submission[@"MainPhoto"] = self.uploadImg;
    submission[@"AvgRating"] = @0;

    [submission saveInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
        if (!error) {
            NSLog(@"Submitted!");
            [((MainTabBarController*)self.tabBarController) sendUpdate];
        }
        else{
            // Log details of the failure
            NSLog(@"Error: %@ %@", error, [error userInfo]);
        }
    }];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
