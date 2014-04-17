//
//  MapViewController.m
//  RateItWashU
//
//  Created by Matt Bullock on 4/8/14.
//
//

#import "MapViewController.h"

@interface MapViewController ()

@end

@implementation MapViewController

@synthesize mapView;
@synthesize selectedMarker;
@synthesize selectedInfoWindow;

-(IBAction)findMyLocation:(id)sender {
//    NSLog(@"why don't you work?!?!?!?!?!?!");
//    _mapView.delegate = self;
    
//    [_mapView setUserTrackingMode:MKUserTrackingModeFollow animated:YES];
    
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {

    }
    
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    GMSCameraPosition *camera = [GMSCameraPosition cameraWithLatitude:38.648769
                                                            longitude:-90.308676
                                                                 zoom:17];
    mapView = [GMSMapView mapWithFrame:CGRectZero camera:camera];
    mapView.settings.myLocationButton = YES;
    mapView.delegate = self;
    self.view = mapView;
    
    [self loadMarkers];
    
    GMSMarker *marker = [[GMSMarker alloc] init];
    marker.position = CLLocationCoordinate2DMake(38.6487616,-90.3100913);
    marker.title = @"Wash U";
    marker.map = mapView;
    
    GMSMarker *marker2 = [[GMSMarker alloc] init];
    marker2.position = CLLocationCoordinate2DMake(38.6484348,-90.3078168);
    marker2.title = @"Olin";
    marker2.map = mapView;
}

-(BOOL) mapView:(GMSMapView *) mapView didTapMarker:(GMSMarker *)marker {
    [selectedInfoWindow removeFromSuperview];
    selectedInfoWindow = [[[NSBundle mainBundle] loadNibNamed:@"InfoWindow" owner:self options:nil] objectAtIndex:0];
    [selectedInfoWindow.details addTarget:self action:@selector(detailsClicked) forControlEvents:UIControlEventTouchUpInside];
    selectedInfoWindow.frame = CGRectMake(0, self.view.frame.size.height - 70 - self.tabBarController.tabBar.frame.size.height, 320, 70);
    [self.view addSubview:selectedInfoWindow];
    selectedMarker.icon = [GMSMarker markerImageWithColor:[UIColor redColor]];
    
    selectedInfoWindow.name.text = marker.title;
    
    selectedMarker = marker;
    selectedMarker.icon = [GMSMarker markerImageWithColor:[UIColor blueColor]];
    
    return YES;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Make sure your segue name in storyboard is the same as this line
    if ([[segue identifier] isEqualToString:@"YOUR_SEGUE_NAME_HERE"])
    {
        // Get reference to the destination view controller
        YourViewController *vc = [segue destinationViewController];
        
        // Pass any objects to the view controller here, like...
        [vc setMyObjectHere:object];
    }
}

-(void) detailsClicked {
    [self performSegueWithIdentifier:@"mapToDetails" sender:self];
}

-(void)addMarker:(PFObject *) pfObj {
    ParseMarker *marker = [[ParseMarker alloc] initWithPFObj:pfObj];
    marker.map = mapView;
}

-(void)loadMarkers {
    // get location
    // get PFObjects of nearby points of interest
    // foreach call addMarker
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
