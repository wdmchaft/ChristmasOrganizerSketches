//
//  PeopleTableViewController.m
//  ChristmasOrganizerSketches
//
//  Created by Simon Meurer on 16.06.11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "PeopleTableViewController.h"


@implementation PeopleTableViewController

- (void)dealloc
{
    [super dealloc];
}

@synthesize tvCell = _tvCell;

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    _persons = [((ChristmasOrganizerSketchesAppDelegate *) [[UIApplication sharedApplication] delegate]) persons];
    
    self.navigationItem.rightBarButtonItem = self.editButtonItem;
    UIBarButtonItem *addButton = [[UIBarButtonItem alloc] initWithTitle:@"Add" style:UIBarButtonItemStyleBordered target:self action:@selector(addButtonAction:)];
    self.navigationItem.leftBarButtonItem = addButton;
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

#pragma mark - Reload

-(void) reload
{
    NSLog(@"PeopleTableViewController reload");
    [self.tableView reloadData];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if(tableView == self.tableView){
        return [_persons count];
    }
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        //cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier] autorelease];
        
        
        [[NSBundle mainBundle] loadNibNamed:@"PersonTableCellView" owner:self options:nil];
        cell = _tvCell;
        self.tvCell = nil;
    }
    
    // Configure the cell...
    
    /*[cell.textLabel setText: [[_persons objectAtIndex: indexPath.row] firstname]];
    [cell.detailTextLabel setText: [[[_persons objectAtIndex: indexPath.row] budget] stringValue]];
    
    cell.imageView.image = [[_persons objectAtIndex: indexPath.row] image];
    */
    
    NSString* name = [[_persons objectAtIndex:indexPath.row] nickname];
    if(!name || [name length] == 0){
        name = [[[[_persons objectAtIndex:indexPath.row] firstname] stringByAppendingString: @" "  ] stringByAppendingString: [[_persons objectAtIndex:indexPath.row] lastname]];
    } 
    [(UILabel *)[ cell viewWithTag:1] setText:name];
    
    NSString* budget = nil;
    if([[_persons objectAtIndex:indexPath.row] budget] && [[_persons objectAtIndex:indexPath.row] budget] > 0){
        budget = [NSString stringWithFormat:@"%g €",[[[_persons objectAtIndex:indexPath.row] budget] floatValue]];
    }
    [(UILabel *)[ cell viewWithTag:2] setText:budget];
    
    if([[_persons objectAtIndex:indexPath.row] image]){
        [(UIImageView *)[ cell viewWithTag:5] setImage:[[_persons objectAtIndex:indexPath.row] image]];
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
        [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
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
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [_persons removeObjectAtIndex:indexPath.row];
        
        [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
        
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}


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

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    PersonDetailViewController *personDetailViewController = [[PersonDetailViewController alloc] initWithPersonOrNil:[_persons objectAtIndex:indexPath.row] nibNameOrNil:@"PersonDetailViewController" bundleOrNil:nil];
    [personDetailViewController setTitle:@"Edit Person"];
    [self.navigationController pushViewController:personDetailViewController animated:YES];
    [personDetailViewController release];
}

-(void)addButtonAction:(id)sender
{
    
    PersonDetailViewController *personDetailViewController = [[PersonDetailViewController alloc] initWithPersonOrNil:nil nibNameOrNil:@"PersonDetailViewController" bundleOrNil:nil];
    [personDetailViewController setTitle:@"Edit Person"];
    [self.navigationController pushViewController:personDetailViewController animated:YES];
    [personDetailViewController release];
}

@end
