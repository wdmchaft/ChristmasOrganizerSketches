//
//  ChristmasOrganizerSketchesAppDelegate.m
//  ChristmasOrganizerSketches
//
//  Created by Simon Meurer on 15.06.11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "ChristmasOrganizerSketchesAppDelegate.h"
#import "Gift.h"

@implementation ChristmasOrganizerSketchesAppDelegate


@synthesize giftsNavigationController = _giftsNavigationController;
@synthesize window=_window;
@synthesize gifts = _gifts;

@synthesize tabBarController=_tabBarController;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    [self load];
    // Add the tab bar controller's current view as a subview of the window
    self.window.rootViewController = self.tabBarController;
    [self.window makeKeyAndVisible];
    return YES;
}

#pragma mark - Load

-(void) load
{
    NSLog(@"load");
    [self loadGifts];
}

- (void)loadGifts
{
    NSLog(@"loadGifts");
    
    NSString* documentsDir = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
    
    NSString *path = [documentsDir stringByAppendingPathComponent:@"gifts.plist"];
    NSFileManager* fileManager = [NSFileManager defaultManager];
    self.gifts = [[NSMutableArray alloc ] init];
    if([fileManager fileExistsAtPath:path]){
        NSArray *data = [NSArray arrayWithContentsOfFile:path];
        for (NSDictionary *dict in data) {
            [self.gifts addObject:[[Gift alloc] initWithDictionary:dict]];
        }
    }
    else {
        Gift *gift = [[Gift alloc] initWithName:@"iPod" place:@"Saturn" price:[NSNumber numberWithInt: 200] person:@""];
        [_gifts addObject:gift];
        [gift release];
    }
}

#pragma mark - Save

-(void)save
{
    NSLog(@"save");
    [self saveGifts];
}

-(void)saveGifts
{
    NSLog(@"saveGifts");
    
    NSMutableArray *data = [NSMutableArray array];
    for (Gift *gift in _gifts) {
        [data addObject:[gift toDictionary]];
    }
    NSString* documentsDir = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
    [data writeToFile:[documentsDir stringByAppendingPathComponent:@"gifts.plist"] atomically:YES];

}

#pragma mark - Application Details

- (void)applicationWillResignActive:(UIApplication *)application
{
    /*
     Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
     Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
     */
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    /*
     Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
     If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
     */
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    /*
     Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
     */
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    /*
     Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
     */
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    /*
     Called when the application is about to terminate.
     Save data if appropriate.
     See also applicationDidEnterBackground:.
     */
    [self save];
}

- (void)dealloc
{
    [_window release];
    [_tabBarController release];
    [_giftsNavigationController release];
    [super dealloc];
}

@end
