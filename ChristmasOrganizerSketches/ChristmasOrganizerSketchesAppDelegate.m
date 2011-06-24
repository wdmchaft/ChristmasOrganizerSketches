//
//  ChristmasOrganizerSketchesAppDelegate.m
//  ChristmasOrganizerSketches
//
//  Created by Simon Meurer on 15.06.11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "ChristmasOrganizerSketchesAppDelegate.h"
#import "GiftsTableViewController.h"
#import "PeopleTableViewController.h"

@implementation ChristmasOrganizerSketchesAppDelegate

@synthesize giftsTableViewController = _giftsTableViewController;
@synthesize peopleTableViewController = _peopleTableViewController;
@synthesize giftsNavigationController = _giftsNavigationController;
@synthesize window=_window;
@synthesize gifts = _gifts;
@synthesize persons = _persons;
@synthesize nextGiftIdent = _nextGiftIdent;
@synthesize nextPersonIdent = _nextPersonIdent;

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
    [self loadPersons];
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
            Gift* g = [[Gift alloc] initWithDictionary:dict];
            if(g.ident >= self.nextGiftIdent)
            {
                self.nextGiftIdent = [NSNumber numberWithInt: [g.ident intValue] + 1];
            }
            [self.gifts addObject:g];
            [g release];
        }
    }
    else {
        Gift *gift = [[Gift alloc] initWithIdent: [NSNumber numberWithInt:1] Name:@"iPod" place:@"Saturn" price:[NSNumber numberWithInt: 200] person:@"" bought:NO image:nil];
        [_gifts addObject:gift];
        [gift release];
        self.nextGiftIdent = [NSNumber numberWithInt:2];
    }
}

-(void) loadPersons
{
    NSLog(@"loadPersons");
    
    NSString* documentsDir = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
    
    NSString *path = [documentsDir stringByAppendingPathComponent:@"persons.plist"];
    NSFileManager* fileManager = [NSFileManager defaultManager];
    self.persons = [[NSMutableArray alloc ] init];
    if([fileManager fileExistsAtPath:path]){
        NSArray *data = [NSArray arrayWithContentsOfFile:path];
        for (NSDictionary *dict in data) {
            Person* p = [[Person alloc] initWithDictionary:dict];
            if(p.ident >= self.nextPersonIdent)
            {
                self.nextPersonIdent = [NSNumber numberWithInt: [p.ident intValue] + 1];
            }
            [self.persons addObject:p];
            [p release];
        }
    }
    else {
        Person *p = [[Person alloc] initWithIdent: [NSNumber numberWithInt:1] name:@"Toni Tester" budget:[NSNumber numberWithInt:150] image:nil];
        [_persons addObject:p];
        [p release];
        self.nextPersonIdent = [NSNumber numberWithInt:2];
    } 
}

#pragma mark - Save

-(void)save
{
    NSLog(@"save");
    [self saveGifts];
    [self savePersons];
}

-(void)saveGifts
{
    NSLog(@"saveGifts");
    
    NSMutableArray *data = [NSMutableArray array];
    for (Gift *gift in _gifts) {
        NSLog(@"Saving gift: %@", gift.name);
        [data addObject:[gift toDictionary]];
    }
    
    NSString* documentsDir = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
    [data writeToFile:[documentsDir stringByAppendingPathComponent:@"gifts.plist"] atomically:YES];

}

-(void) savePersons
{
    
    NSLog(@"savePersons");
    
    NSMutableArray *data = [NSMutableArray array];
    for (Person *person in _persons) {
        NSLog(@"Saving person: %@",person.name);
        [data addObject:[person toDictionary]];
    }
    
    NSString* documentsDir = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
    [data writeToFile:[documentsDir stringByAppendingPathComponent:@"persons.plist"] atomically:YES];

}

#pragma mark - Reload tableViews

-(void) reloadGiftsTableViewController
{
    [_giftsTableViewController reload ];
}

-(void) reloadPeopleTableViewController
{
    NSLog(@"reloadPeopleTableViewController");
    [_peopleTableViewController reload ];
}

#pragma mark - Adding things

-(void) addGift:(Gift *)gift
{
    if(!gift.ident){
        gift.ident = self.nextGiftIdent;
        self.nextGiftIdent = [NSNumber numberWithInt:([self.nextGiftIdent intValue] + 1)];
    }
    [self.gifts addObject:gift];
}

-(void) addPerson:(Person *)person
{
    if(!person.ident){
        person.ident = self.nextPersonIdent;
        self.nextPersonIdent = [NSNumber numberWithInt:([self.nextPersonIdent intValue] + 1)];
    }
    [self.persons addObject:person];
}

#pragma mark getting Things

-(NSMutableArray*) getGiftsForPerson:(Person *)person
{
    NSMutableArray* result = [NSMutableArray array];
    for(Gift* g in self.gifts){
        if([person.name isEqualToString:g.person]){
            [result addObject:g];
        }
    }
    return result;
}

-(BOOL) personWithNameExists:(NSString*) name
{
    for(Person* p in _persons){
        if([p.name isEqualToString:name]){
            return YES;
        }
    }
    return NO;
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
    [_gifts release];
    [_persons release];
    [_window release];
    [_tabBarController release];
    [_giftsNavigationController release];
    [_peopleTableViewController release];
    [_giftsTableViewController release];
    [super dealloc];
}

@end
