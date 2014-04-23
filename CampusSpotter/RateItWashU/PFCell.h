//
//  PFCell.h
//  RateItWashU
//
//  Created by Matt Bullock on 4/23/14.
//
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>


@interface PFCell : UITableViewCell

- (id)initWithPFObj:(PFObject*) pfObj;

@property (nonatomic,strong) PFObject *parseData;

@end
