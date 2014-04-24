//
//  CommentsTableView.m
//  RateItWashU
//
//  Created by Parker Crist on 4/14/14.
//
//

#import "CommentsTableView.h"
#import "CommentDetail.h"

@interface CommentsTableView ()

@end

@implementation CommentsTableView

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    DetailTabBar * parent = (DetailTabBar *)self.tabBarController;
    item = [parent item];
 //   [self.tableView setContentInset:UIEdgeInsetsMake(65,0,65,0)];

    [self.tabBarItem setTitle: @"Comments"];
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
    
    DetailTabBar * parent = (DetailTabBar *)self.tabBarController;
    comments = [parent comments];
    return comments.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    // Configure the cell...
    if (cell == NULL) {
        PFObject * comment = (PFObject *)[comments objectAtIndex:indexPath.row];
        cell = [[UITableViewCell alloc] init];
        
        UILabel * nameLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, cell.frame.size.width/3, cell.frame.size.height/2)];
        nameLabel.text = comment[@"username"];
        nameLabel.textAlignment = NSTextAlignmentCenter;
        [cell addSubview:nameLabel];
        
        UILabel * commentLabel = [[UILabel alloc] initWithFrame:CGRectMake(cell.frame.size.width/3, 0, 2*cell.frame.size.width/3, cell.frame.size.height)];
        commentLabel.text = comment[@"commentTitle"];
        commentLabel.font = [UIFont systemFontOfSize:13];
        [cell addSubview:commentLabel];
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        
        //Add the stars
        int starSize = cell.frame.size.height/2-3;
        int starSpacing = ((cell.frame.size.width/3)-5*starSize - 10)/4;
        for (int i = 0; i < 5; i++) {
            UIImageView * currentStar = [[UIImageView alloc] initWithFrame: CGRectMake(5 + i*(starSize + starSpacing), cell.frame.size.height/2, starSize, starSize)];
            if ([comment[@"rating"] intValue] >= (i+1)) {
                currentStar.image = [UIImage imageNamed:@"starOn.png"];
            }
            else {
                currentStar.image = [UIImage imageNamed:@"starOff.png"];
            }
            [cell addSubview:currentStar];
        }
        
    }
    
    return cell;
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
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
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

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self performSegueWithIdentifier:@"commentDetail" sender:(PFObject *)[comments objectAtIndex:indexPath.row]];
}

#pragma mark - Navigation

// In a story board-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    CommentDetail * detail = segue.destinationViewController;
    PFObject * comment = sender;
    [detail setAuthor: comment[@"username"]];
    [detail setComment: comment[@"comment"]];
    [detail setCommentTitle: comment[@"commentTitle"]];
    [detail setRating: [comment[@"rating"] intValue]];
    [detail setImage: comment[@"image"]];
}

- (void) viewDidAppear:(BOOL)animated {
    [self.tableView reloadData];
    [self.tableView reloadRowsAtIndexPaths:[self.tableView indexPathsForVisibleRows]
                          withRowAnimation:UITableViewRowAnimationNone];
}



@end
