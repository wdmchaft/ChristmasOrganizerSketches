//
//  ChristmasOrganizerSketchesAppDelegate.h
//  ChristmasOrganizerSketches
//
//  Created by Simon Meurer on 15.06.11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GiftsTableViewController.h"
#import "PeopleTableViewController.h"
#import "Gift.h"
#import "Person.h"

@interface ChristmasOrganizerSketchesAppDelegate : NSObject <UIApplicationDelegate, UITabBarControllerDelegate> {

    UINavigationController *_giftsNavigationController;
    PeopleTableViewController *_peopleTableViewController;
    GiftsTableViewController *_giftsTableViewController;
}

-(void) load;
-(void) loadGifts;
-(void) loadPersons;

-(void) save;
-(void) saveGifts;
-(void) savePersons;

-(void) reloadGiftsTableViewController;
-(void) reloadPeopleTableViewController;

@property (nonatomic, retain) IBOutlet GiftsTableViewController *giftsTableViewController;
@property (nonatomic, retain) IBOutlet PeopleTableViewController *peopleTableViewController;
@property (nonatomic, retain) IBOutlet UINavigationController *giftsNavigationController;
@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet UITabBarController *tabBarController;
@property (nonatomic, retain) NSMutableArray *gifts;
@property (nonatomic, retain) NSMutableArray *persons;

@end
