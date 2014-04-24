//
//  CategoriesViewController.m
//  RateItWashU
//
//  Created by Matt Bullock on 4/7/14.
//
//

#import "FavoritesViewController.h"



@interface FavoritesViewController ()

@end

@implementation FavoritesViewController

@synthesize favorites;
@synthesize clickedCell;

- (void)viewDidLoad
{
    self.title = @"Favorites";
    favorites = ((MainTabBarController*)self.tabBarController).favorites;
    [super viewDidLoad];
    
    UIRefreshControl *refresh = [[UIRefreshControl alloc] init];
    
    refresh.attributedTitle = [[NSAttributedString alloc] initWithString:@"Pull to Refresh"];
    
    [refresh addTarget:self action:@selector(updateFavorites:) forControlEvents:UIControlEventValueChanged];
    [self setRefreshControl:refresh];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

-(void)updateFavorites:(id)sender {
    [((MainTabBarController*)self.tabBarController) updateFavorites];
    [(UIRefreshControl *)sender endRefreshing];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return [favorites count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    
    PFCell *cell = [self.tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (cell == nil) {
        
        cell = [[PFCell alloc] initWithPFObj:[favorites objectAtIndex:indexPath.row]];
        
    }
    
    // Configure the cell...
    
    cell.textLabel.text = ((NSString*)[favorites objectAtIndex:indexPath.row][@"Title"]);
    cell.textLabel.textColor = [UIColor colorWithRed:219/255.0f green:219/255.0f blue:219/255.0f alpha:1.0f];
    
    return cell;
}

-(void)changeCategory {
    favorites = ((MainTabBarController*)self.tabBarController).favorites;
    [self.tableView reloadData];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Make sure your segue name in storyboard is the same as this line
    if ([[segue identifier] isEqualToString:@"favToDetail"])
    {
        // Get reference to the destination view controller
        [[segue destinationViewController] setItem:clickedCell.parseData];
    }
}

/*
 // Override to support conditional editing of the table view.
 - (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
 {
 // Return NO if you do not want the specified item to be editable.
 return YES;
 }
 */

/*
 // Override to support editing the table view.
 - (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
 {
 if (editingStyle == UITableViewCellEditingStyleDelete) {
 // Delete the row from the data source
 [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
 } else if (editingStyle == UITableViewCellEditingStyleInsert) {
 // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
 }
 }
 */

/*
 // Override to support rearranging the table view.
 - (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
 {
 }
 */

/*
 // Override to support conditional rearranging of the table view.
 - (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
 {
 // Return NO if you do not want the item to be re-orderable.
 return YES;
 }
 */


#pragma mark - Table view delegate

// In a xib-based application, navigation from a table can be handled in -tableView:didSelectRowAtIndexPath:
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Navigation logic may go here, for example:
    // Create the next view controller.
    clickedCell = (PFCell*)[tableView cellForRowAtIndexPath:indexPath];
    //    NSLog(@"%@",cell.parseData); //replace "dictionary" by the name of the property you created in the subclass
    // Push the view controller.
    [self performSegueWithIdentifier:@"favToDetail" sender:self];
}


@end
