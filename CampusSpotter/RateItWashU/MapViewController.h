//
//  MapViewController.h
//  RateItWashU
//
//  Created by Matt Bullock on 4/8/14.
//
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>

@interface MapViewController : UIViewController <MKMapViewDelegate>

@property IBOutlet MKMapView *mapView;

-(IBAction)findMyLocation:(id)sender;

@end
