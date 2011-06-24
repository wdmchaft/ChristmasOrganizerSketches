//
//  PersonDetailViewController.h
//  ChristmasOrganizerSketches
//
//  Created by Simon Meurer on 20.06.11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Person.h"
#import "ChristmasOrganizerSketchesAppDelegate.h"


@interface PersonDetailViewController : UIViewController <UITextFieldDelegate, UIImagePickerControllerDelegate, UIAlertViewDelegate>  {
    
    UIButton *imageButton;
    UIBarButtonItem *cancelButtonItem;
    UIBarButtonItem *saveButtonItem;
    UITextField *nameTextField;
    UITextField *budgetTextField;
}
-(id)initWithPersonOrNil: (Person *) person nibNameOrNil: (NSString *)nibNameOrNil bundleOrNil:(NSBundle *)nibBundleOrNil;

- (IBAction)cancelButtonItemDidActivate:(id)sender;
- (IBAction)saveButtonItemDidActivate:(id)sender;
- (IBAction)imageButtonClicked:(id)sender;
- (BOOL) startMediaBrowserFromViewController: (UIViewController*) controller
                               usingDelegate: (id <UIImagePickerControllerDelegate,
                                               UINavigationControllerDelegate>) delegate;

@property (nonatomic, retain) IBOutlet UITextField *budgetTextField;
@property (nonatomic, retain) IBOutlet UIButton *imageButton;
@property (nonatomic, retain) IBOutlet UIBarButtonItem *cancelButtonItem;
@property (nonatomic, retain) Person *person;
@property (nonatomic, retain) IBOutlet UIBarButtonItem *saveButtonItem;
@property (nonatomic, retain) IBOutlet UITextField *nameTextField;

@end
