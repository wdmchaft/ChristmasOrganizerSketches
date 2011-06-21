//
//  PeopleTableViewController.h
//  ChristmasOrganizerSketches
//
//  Created by Simon Meurer on 16.06.11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ChristmasOrganizerSketchesAppDelegate.h"
#import "PersonDetailViewController.h"


@interface PeopleTableViewController : UITableViewController<UITableViewDelegate, UITableViewDataSource> {
    
    NSMutableArray* _persons;
}
-(void) addButtonAction:(id)sender;
-(void) reload;

@end
