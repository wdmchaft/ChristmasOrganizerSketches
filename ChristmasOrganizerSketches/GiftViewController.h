//
//  GiftViewController.h
//  ChristmasOrganizerSketches
//
//  Created by Simon Meurer on 16.06.11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Gift.h"
#import "Person.h"
#import "ChristmasOrganizerSketchesAppDelegate.h"


@interface GiftViewController : UIViewController <UITextFieldDelegate, UIImagePickerControllerDelegate> {
    
    UITextField *personTextField;
    UITextField *placeTextField;
    UITextField *priceTextField;
    UITextField *nameTextField;
    UIBarButtonItem *cancelButtonItem;
    UIBarButtonItem *saveButtonItem;
    UISwitch *boughtSwitch;
    UIButton *imageButton;
}

-(id)initWithGiftOrNil: (Gift *) gift nibNameOrNil: (NSString *)nibNameOrNil bundleOrNil:(NSBundle *)nibBundleOrNil;

- (IBAction)cancelButtonItemDidActivate:(id)sender;
- (IBAction)saveButtonItemDidActivate:(id)sender;
- (IBAction)imageButtonClicked:(id)sender;
- (BOOL) startMediaBrowserFromViewController: (UIViewController*) controller
                               usingDelegate: (id <UIImagePickerControllerDelegate,
                                               UINavigationControllerDelegate>) delegate;

@property (nonatomic, retain) IBOutlet UIButton *imageButton;
@property (nonatomic, retain) IBOutlet UISwitch *boughtSwitch;
@property (nonatomic, retain) IBOutlet UIBarButtonItem *saveButtonItem;
@property (nonatomic, retain) IBOutlet UIBarButtonItem *cancelButtonItem;
@property (nonatomic, retain) IBOutlet UITextField *personTextField;
@property (nonatomic, retain) IBOutlet UITextField *placeTextField;
@property (nonatomic, retain) IBOutlet UITextField *priceTextField;
@property (nonatomic, retain) IBOutlet UITextField *nameTextField;
@property (nonatomic, retain) Gift *gift;

@end
