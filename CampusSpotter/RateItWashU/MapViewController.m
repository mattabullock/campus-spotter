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

-(IBAction)findMyLocation:(id)sender {
//    NSLog(@"why don't you work?!?!?!?!?!?!");
//    _mapView.delegate = self;
    
//    [_mapView setUserTrackingMode:MKUserTrackingModeFollow animated:YES];
    
}

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
    GMSCameraPosition *camera = [GMSCameraPosition cameraWithLatitude:38.648769
                                                            longitude:-90.308676
                                                                 zoom:17];
    mapView = [GMSMapView mapWithFrame:CGRectZero camera:camera];
    mapView.settings.myLocationButton = YES;
    mapView.delegate = self;
    self.view = mapView;
    GMSMarker *marker = [[GMSMarker alloc] init];
    marker.position = CLLocationCoordinate2DMake(38.648769, -90.308676);
    marker.title = @"Sydney";
    marker.snippet = @"Australia";
    marker.map = mapView;
//    mapView.myLocationEnabled = YES;
//    mapView.mapType =
    //38.648769, -90.308676

    // Do any additional setup after loading the view.
}

-(BOOL) mapView:(GMSMapView *) mapView didTapMarker:(GMSMarker *)marker {
    NSLog(@"stupid");
    return YES;
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
