//
//  ChristmasOrganizerSketchesAppDelegate.h
//  ChristmasOrganizerSketches
//
//  Created by Simon Meurer on 15.06.11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ChristmasOrganizerSketchesAppDelegate : NSObject <UIApplicationDelegate, UITabBarControllerDelegate> {

    UINavigationController *_giftsNavigationController;
}
@property (nonatomic, retain) IBOutlet UINavigationController *giftsNavigationController;

@property (nonatomic, retain) IBOutlet UIWindow *window;

@property (nonatomic, retain) IBOutlet UITabBarController *tabBarController;

@end
