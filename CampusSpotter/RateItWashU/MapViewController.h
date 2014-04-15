//
//  MapViewController.h
//  RateItWashU
//
//  Created by Matt Bullock on 4/8/14.
//
//

#import <UIKit/UIKit.h>
#import <GoogleMaps/GoogleMaps.h>

@interface MapViewController : UIViewController <GMSMapViewDelegate>

@property IBOutlet GMSMapView *mapView;

-(IBAction)findMyLocation:(id)sender;

@end
