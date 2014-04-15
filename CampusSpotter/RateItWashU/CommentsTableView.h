//
//  CommentsTableView.h
//  RateItWashU
//
//  Created by Parker Crist on 4/14/14.
//
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>
#import "DetailTabBar.h"

@interface CommentsTableView : UITableViewController {
    PFObject * item;
}

@end
