//
//  PFCell.m
//  RateItWashU
//
//  Created by Matt Bullock on 4/23/14.
//
//

#import "PFCell.h"

@implementation PFCell

@synthesize parseData;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (id)initWithPFObj:(PFObject*) pfObj
{
    self = [super init];
    if (self) {
        parseData = pfObj;
    }
    return self;
}

- (void)awakeFromNib
{
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
