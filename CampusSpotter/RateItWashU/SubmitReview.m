//
//  SubmitReview.m
//  RateItWashU
//
//  Created by Parker Crist on 4/15/14.
//
//

#import "SubmitReview.h"

@interface SubmitReview ()

@end

@implementation SubmitReview
@synthesize star1, star2, star3, star4, star5;
@synthesize comment, commentTitle, submit;

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
	// Do any additional setup after loading the view.
    currentRating = 5;
    UIImage *starImg = [UIImage imageNamed:@"starOff.png"];
    [star1 setImage:starImg forState:UIControlStateNormal];
    [star2 setImage:starImg forState:UIControlStateNormal];
    [star3 setImage:starImg forState:UIControlStateNormal];
    [star4 setImage:starImg forState:UIControlStateNormal];
    [star5 setImage:starImg forState:UIControlStateNormal];
    
    comment.layer.cornerRadius=8.0f;
    comment.layer.masksToBounds=YES;
    comment.layer.borderColor=[[UIColor blackColor]CGColor];
    comment.layer.borderWidth= 1.0f;
    
    
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]
                                   initWithTarget:self
                                   action:@selector(dismissKeyboard)];
    [self.view addGestureRecognizer:tap];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(void)dismissKeyboard {
    [comment resignFirstResponder];
    [commentTitle resignFirstResponder];
}

- (IBAction)submitClicked:(id)sender {
    if (commentTitle.text.length == 0 || comment.text.length == 0) {
        UIAlertView *error = [[UIAlertView alloc] initWithTitle:@"Empty Field"
                                                            message:@"Please make sure to fill out every field before submitting"
                                                           delegate:self
                                                  cancelButtonTitle:@"Return"
                                                  otherButtonTitles:nil];
        [error show];
        return;
    }
    PFObject *testObject = [PFObject objectWithClassName:@"Comment"];
    PFUser * currentUser = [PFUser currentUser];
    
    DetailTabBar * parent = (DetailTabBar *)self.tabBarController;
    PFObject * item = [parent item];
    
    testObject[@"username"] = currentUser.username;
    testObject[@"commentTitle"] = commentTitle.text;
    testObject[@"comment"] = comment.text;
    testObject[@"rating"] = [NSNumber numberWithInt:currentRating];
    testObject[@"item"] = item;
    if (uploadedImage != NULL) {
        testObject[@"image"] = uploadedImage;
    }
    [testObject saveInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
        [parent updateContent];
        NSArray * comments = [parent comments];
        int avgRating = 0;
        for (PFObject * comment2 in comments) {
            avgRating += [comment2[@"rating"] intValue];
        }
        if(comments.count > 0) {
            avgRating = avgRating/comments.count;
        } else {
            avgRating = 0;
        }
        item[@"AvgRating"] = [NSNumber numberWithInt:avgRating];
        [item saveInBackground];
    }];
    
    [comment setText:@""];
    [commentTitle setText: @""];
    UIImage *starOff = [UIImage imageNamed:@"starOff.png"];
    [star1 setImage:starOff forState:UIControlStateNormal];
    [star2 setImage:starOff forState:UIControlStateNormal];
    [star3 setImage:starOff forState:UIControlStateNormal];
    [star4 setImage:starOff forState:UIControlStateNormal];
    [star5 setImage:starOff forState:UIControlStateNormal];
}


- (IBAction)star1clicked:(id)sender {
    UIImage *starOn = [UIImage imageNamed:@"starOn.png"];
    UIImage *starOff = [UIImage imageNamed:@"starOff.png"];
    [star1 setImage:starOn forState:UIControlStateNormal];
    [star2 setImage:starOff forState:UIControlStateNormal];
    [star3 setImage:starOff forState:UIControlStateNormal];
    [star4 setImage:starOff forState:UIControlStateNormal];
    [star5 setImage:starOff forState:UIControlStateNormal];
    currentRating = 1;
}
- (IBAction)star2clicked:(id)sender {
    UIImage *starOn = [UIImage imageNamed:@"starOn.png"];
    UIImage *starOff = [UIImage imageNamed:@"starOff.png"];
    [star1 setImage:starOn forState:UIControlStateNormal];
    [star2 setImage:starOn forState:UIControlStateNormal];
    [star3 setImage:starOff forState:UIControlStateNormal];
    [star4 setImage:starOff forState:UIControlStateNormal];
    [star5 setImage:starOff forState:UIControlStateNormal];
    currentRating = 2;
}
- (IBAction)star3clicked:(id)sender {
    UIImage *starOn = [UIImage imageNamed:@"starOn.png"];
    UIImage *starOff = [UIImage imageNamed:@"starOff.png"];
    [star1 setImage:starOn forState:UIControlStateNormal];
    [star2 setImage:starOn forState:UIControlStateNormal];
    [star3 setImage:starOn forState:UIControlStateNormal];
    [star4 setImage:starOff forState:UIControlStateNormal];
    [star5 setImage:starOff forState:UIControlStateNormal];
    currentRating = 3;
}
- (IBAction)star4clicked:(id)sender {
    UIImage *starOn = [UIImage imageNamed:@"starOn.png"];
    UIImage *starOff = [UIImage imageNamed:@"starOff.png"];
    [star1 setImage:starOn forState:UIControlStateNormal];
    [star2 setImage:starOn forState:UIControlStateNormal];
    [star3 setImage:starOn forState:UIControlStateNormal];
    [star4 setImage:starOn forState:UIControlStateNormal];
    [star5 setImage:starOff forState:UIControlStateNormal];
    currentRating = 4;
}
- (IBAction)star5clicked:(id)sender {
    UIImage *starOn = [UIImage imageNamed:@"starOn.png"];
    [star1 setImage:starOn forState:UIControlStateNormal];
    [star2 setImage:starOn forState:UIControlStateNormal];
    [star3 setImage:starOn forState:UIControlStateNormal];
    [star4 setImage:starOn forState:UIControlStateNormal];
    [star5 setImage:starOn forState:UIControlStateNormal];
    currentRating = 5;
}
- (IBAction)uploadImage:(id)sender {
    if ([UIImagePickerController isSourceTypeAvailable:
         UIImagePickerControllerSourceTypeSavedPhotosAlbum] == YES){
        upload = sender;
        // Create image picker controller
        UIImagePickerController *imagePicker = [[UIImagePickerController alloc] init];
        
        // Set source to saved photos
        imagePicker.sourceType =  UIImagePickerControllerSourceTypeSavedPhotosAlbum;
        
        // Delegate is self
        imagePicker.delegate = self;
        
        // Show image picker
        [self presentViewController:imagePicker animated:YES completion:nil];
    }
}

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
    {
        //Access the image
        UIImage *image = [info objectForKey:@"UIImagePickerControllerOriginalImage"];
    
        // Dismiss controller
        [picker dismissViewControllerAnimated:YES completion:nil];
    
        NSData *imageData = UIImageJPEGRepresentation(image, 0.75f);
        
        uploadedImage = [PFFile fileWithName:@"Image.jpg" data:imageData];
        
        UIImageView * check = [[UIImageView alloc] initWithFrame:CGRectMake(upload.frame.origin.x + upload.frame.size.width + 5, upload.frame.origin.y + 5, upload.frame.size.height - 10, upload.frame.size.height - 10)];
        check.image = [UIImage imageNamed:@"check.png"];
        check.contentMode = UIViewContentModeScaleAspectFit;

        [self.view addSubview:check];
}



@end
