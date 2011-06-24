//
//  ChristmasOrganizerSketchesAppDelegate.h
//  ChristmasOrganizerSketches
//
//  Created by Simon Meurer on 15.06.11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Gift.h"
#import "Person.h"

@class PeopleTableViewController;
@class GiftsTableViewController;

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

-(NSMutableArray*) getGiftsForPerson: (Person*) person;
-(float) getGiftPricesForPerson: (Person*) person;

-(void) addGift: (Gift*) gift;
-(void) addPerson: (Person*) person;

@property (nonatomic, retain) IBOutlet GiftsTableViewController *giftsTableViewController;
@property (nonatomic, retain) IBOutlet PeopleTableViewController *peopleTableViewController;
@property (nonatomic, retain) IBOutlet UINavigationController *giftsNavigationController;
@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet UITabBarController *tabBarController;
@property (nonatomic, retain) NSMutableArray *gifts;
@property (nonatomic, retain) NSMutableArray *persons;
@property (nonatomic, copy) NSNumber *nextGiftIdent;
@property (nonatomic, copy) NSNumber *nextPersonIdent;

@end
