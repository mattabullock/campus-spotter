//
//  ParseMarker.m
//  RateItWashU
//
//  Created by Matt Bullock on 4/16/14.
//
//

#import "ParseMarker.h"

@implementation ParseMarker

@synthesize parseData;

-(id)initWithPFObj:(PFObject *)pfObj {
    self = [super init];
    parseData = pfObj;
    PFGeoPoint *geo = parseData[@"Location"];
    self.position = CLLocationCoordinate2DMake(geo.longitude, geo.latitude);
    
    self.title = parseData[@"Title"];
    
    return self;
}

@end
