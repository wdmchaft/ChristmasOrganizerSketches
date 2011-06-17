//
//  ChristmasOrganizerSketchesAppDelegate.h
//  ChristmasOrganizerSketches
//
//  Created by Simon Meurer on 15.06.11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GiftsTableViewController.h"
#import "Gift.h"

@interface ChristmasOrganizerSketchesAppDelegate : NSObject <UIApplicationDelegate, UITabBarControllerDelegate> {

    UINavigationController *_giftsNavigationController;
    GiftsTableViewController *_giftsTableViewController;
}

-(void) load;
-(void) loadGifts;

-(void) save;
-(void) saveGifts;

-(void) reloadGiftsTableViewController;

@property (nonatomic, retain) IBOutlet GiftsTableViewController *giftsTableViewController;
@property (nonatomic, retain) IBOutlet UINavigationController *giftsNavigationController;
@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet UITabBarController *tabBarController;
@property (nonatomic, retain) NSMutableArray *gifts;

@end
