//
//  GiftsTableViewController.h
//  ChristmasOrganizerSketches
//
//  Created by Simon Meurer on 16.06.11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GiftViewController.h"
#import "ChristmasOrganizerSketchesAppDelegate.h"


@interface GiftsTableViewController : UITableViewController <UITableViewDelegate, UITableViewDataSource>{
    
    NSMutableArray *_gifts;
}

-(void) addButtonAction:(id)sender;
-(void) reload;

@property (nonatomic,assign) IBOutlet UITableViewCell *tvCell;

@end
