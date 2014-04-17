//
//  ParseMarker.h
//  RateItWashU
//
//  Created by Matt Bullock on 4/16/14.
//
//

#import <GoogleMaps/GoogleMaps.h>
#import <Parse/Parse.h>

@interface ParseMarker : GMSMarker

@property (weak, nonatomic) PFObject *parseData;

-(id)initWithPFObj:(PFObject *)pfObj;

@end
