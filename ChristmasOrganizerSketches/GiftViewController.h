//
//  GiftViewController.h
//  ChristmasOrganizerSketches
//
//  Created by Simon Meurer on 16.06.11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Gift.h"
#import "ChristmasOrganizerSketchesAppDelegate.h"


@interface GiftViewController : UIViewController {
    
    UITextField *personTextField;
    UITextField *placeTextField;
    UITextField *priceTextField;
    UITextField *nameTextField;
    UIBarButtonItem *cancelButtonItem;
    UIBarButtonItem *saveButtonItem;
}

-(id)initWithGiftOrNil: (Gift *) gift nibNameOrNil: (NSString *)nibNameOrNil bundleOrNil:(NSBundle *)nibBundleOrNil;

- (IBAction)cancelButtonItemDidActivate:(id)sender;
- (IBAction)saveButtonItemDidActivate:(id)sender;

@property (nonatomic, retain) IBOutlet UIBarButtonItem *saveButtonItem;
@property (nonatomic, retain) IBOutlet UIBarButtonItem *cancelButtonItem;
@property (nonatomic, retain) IBOutlet UITextField *personTextField;
@property (nonatomic, retain) IBOutlet UITextField *placeTextField;
@property (nonatomic, retain) IBOutlet UITextField *priceTextField;
@property (nonatomic, retain) IBOutlet UITextField *nameTextField;
@property (nonatomic, retain) Gift *gift;

@end
