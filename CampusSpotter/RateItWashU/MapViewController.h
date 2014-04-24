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
#import "MainTabBarController.h"
#import "DetailTabBar.h"

@interface MapViewController : UIViewController <GMSMapViewDelegate, UpdateListener>

+(CLLocation*)getLocation;

@property NSMutableArray *markers;

@property IBOutlet GMSMapView *mapView;
@property ParseMarker *selectedMarker;
@property InfoWindow *selectedInfoWindow;

@end

CLLocation* location;
