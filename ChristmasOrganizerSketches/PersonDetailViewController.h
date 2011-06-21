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


@interface PersonDetailViewController : UIViewController <UITextFieldDelegate, UIImagePickerControllerDelegate>  {
    
    UIButton *imageButton;
    UITextField *firstTextField;
    UITextField *lastTextField;
    UITextField *nickTextField;
    UISlider *budgetSlider;
    UIBarButtonItem *cancelButtonItem;
    UIBarButtonItem *saveButtonItem;
}
-(id)initWithPersonOrNil: (Person *) person nibNameOrNil: (NSString *)nibNameOrNil bundleOrNil:(NSBundle *)nibBundleOrNil;

- (IBAction)cancelButtonItemDidActivate:(id)sender;
- (IBAction)saveButtonItemDidActivate:(id)sender;
- (IBAction)imageButtonClicked:(id)sender;
- (BOOL) startMediaBrowserFromViewController: (UIViewController*) controller
                               usingDelegate: (id <UIImagePickerControllerDelegate,
                                               UINavigationControllerDelegate>) delegate;

@property (nonatomic, retain) IBOutlet UIButton *imageButton;
@property (nonatomic, retain) IBOutlet UITextField *firstTextField;
@property (nonatomic, retain) IBOutlet UITextField *lastTextField;
@property (nonatomic, retain) IBOutlet UITextField *nickTextField;
@property (nonatomic, retain) IBOutlet UISlider *budgetSlider;
@property (nonatomic, retain) IBOutlet UIBarButtonItem *cancelButtonItem;
@property (nonatomic, retain) Person *person;
@property (nonatomic, retain) IBOutlet UIBarButtonItem *saveButtonItem;

@end
