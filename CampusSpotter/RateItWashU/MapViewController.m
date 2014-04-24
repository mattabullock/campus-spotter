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
@synthesize markers;

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
    markers = [[NSMutableArray alloc] init];
    GMSCameraPosition *camera = [GMSCameraPosition cameraWithLatitude:38.648769
                                                            longitude:-90.308676
                                                                 zoom:17];
    mapView = [GMSMapView mapWithFrame:self.view.bounds camera:camera];
    mapView.delegate = self;
    
    [mapView addObserver:self forKeyPath:@"myLocation" options:NSKeyValueObservingOptionNew context:NULL];
    dispatch_async(dispatch_get_main_queue(), ^{
        mapView.myLocationEnabled = YES;
    });
    
    mapView.settings.myLocationButton = YES;
    mapView.settings.compassButton = YES;
    
    [self.view insertSubview:mapView atIndex:0];
    
    [self loadMarkers];
    
}

-(BOOL) mapView:(GMSMapView *) mapView didTapMarker:(ParseMarker *)marker {
    [selectedInfoWindow removeFromSuperview];
    selectedInfoWindow = [[[NSBundle mainBundle] loadNibNamed:@"InfoWindow" owner:self options:nil] objectAtIndex:0];
    [selectedInfoWindow.details addTarget:self action:@selector(detailsClicked) forControlEvents:UIControlEventTouchUpInside];
    selectedInfoWindow.frame = CGRectMake(0, self.view.frame.size.height - 70 - self.tabBarController.tabBar.frame.size.height, 320, 70);
    selectedInfoWindow.data = marker.parseData;
    [selectedInfoWindow getRating];
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
    if ([[segue identifier] isEqualToString:@"mapToDetails"])
    {
        // Get reference to the destination view controller
//        NSLog(@"%@",selectedMarker.parseData);
        [[segue destinationViewController] setItem:selectedMarker.parseData];
    }
}

-(void) detailsClicked {
    [self performSegueWithIdentifier:@"mapToDetails" sender:self];
}

-(void)addMarker:(PFObject *) pfObj {
    ParseMarker *marker = [[ParseMarker alloc] initWithPFObj:pfObj];
    marker.map = mapView;
}

-(void)changeCategory {
    [self loadMarkers];
}

-(void)loadMarkers {
    for(ParseMarker *pm in markers) {
        pm.map = nil;
    }
    
    [markers removeAllObjects];
    
    NSArray *temp = ((MainTabBarController*)self.tabBarController).places;
    
    for(PFObject *p in temp) {
        ParseMarker *marker = [[ParseMarker alloc] init];
        marker.parseData = p;
        PFGeoPoint *geo = p[@"Location"];
        marker.position = CLLocationCoordinate2DMake(geo.latitude, geo.longitude);
        NSString *title = p[@"Title"];
        marker.title = title;
        marker.map = mapView;
        [markers addObject:marker];
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)observeValueForKeyPath:(NSString *)keyPath
                      ofObject:(id)object
                        change:(NSDictionary *)change
                       context:(void *)context {}

- (IBAction)centerOnUser:(id)sender {
    CLLocation *location = mapView.myLocation;
    if (location) {
        [mapView animateToLocation:location.coordinate];
    }
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
