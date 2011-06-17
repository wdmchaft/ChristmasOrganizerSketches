//
//  GiftsTableViewController.m
//  ChristmasOrganizerSketches
//
//  Created by Simon Meurer on 16.06.11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "GiftsTableViewController.h"
#import "GiftViewController.h"
#import "ChristmasOrganizerSketchesAppDelegate.h"


@implementation GiftsTableViewController

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
    
    _gifts = [((ChristmasOrganizerSketchesAppDelegate *) [[UIApplication sharedApplication] delegate]) gifts];
    
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
        return [_gifts count];
    }
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        [[NSBundle mainBundle] loadNibNamed:@"GiftTableCellView" owner:self options:nil];
        cell = _tvCell;
        self.tvCell = nil;
    }
    
    // Configure the cell...
    
    //[cell.textLabel setText: [[_gifts objectAtIndex:indexPath.row] name]];
    //[cell.detailTextLabel setText:[[[_gifts objectAtIndex:indexPath.row] price] stringValue]];
    
    //cell.accessoryType = UITableViewCellAccessoryDetailDisclosureButton;
    
    [(UILabel *)[ cell viewWithTag:1] setText:[[_gifts objectAtIndex:indexPath.row] name]];
    [(UILabel *)[ cell viewWithTag:2] setText:[[[_gifts objectAtIndex:indexPath.row] price] stringValue]];
    NSString* bought = [[_gifts objectAtIndex:indexPath.row] bought] ? @"" : @"!";
    [(UILabel *)[ cell viewWithTag:3] setText: bought];
    
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

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    GiftViewController *giftViewController = [[GiftViewController alloc] initWithGiftOrNil:[_gifts objectAtIndex:indexPath.row] nibNameOrNil:@"GiftViewController" bundleOrNil:nil];
    [giftViewController setTitle:@"Edit Gift"];
     [self.navigationController pushViewController:giftViewController animated:YES];
     [giftViewController release];
}

-(void)addButtonAction:(id)sender
{
    
    GiftViewController *giftViewController = [[GiftViewController alloc] initWithGiftOrNil:nil nibNameOrNil:@"GiftViewController" bundleOrNil:nil];
    [giftViewController setTitle:@"Add Gift"];
    [self.navigationController pushViewController:giftViewController animated:YES];
    [giftViewController release];
}

@end
