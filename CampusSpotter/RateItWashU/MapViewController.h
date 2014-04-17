//
//  MapViewController.h
//  RateItWashU
//
//  Created by Matt Bullock on 4/8/14.
//
//

#import <UIKit/UIKit.h>
#import <GoogleMaps/GoogleMaps.h>
#import <Parse/Parse.h>
#import "InfoWindow.h"
#import "ParseMarker.h"

@interface MapViewController : UIViewController <GMSMapViewDelegate>

@property IBOutlet GMSMapView *mapView;
@property GMSMarker *selectedMarker;
@property InfoWindow *selectedInfoWindow;

-(IBAction)findMyLocation:(id)sender;

@end
