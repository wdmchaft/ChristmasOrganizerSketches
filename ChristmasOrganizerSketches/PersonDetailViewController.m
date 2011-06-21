//
//  PersonDetailViewController.m
//  ChristmasOrganizerSketches
//
//  Created by Simon Meurer on 20.06.11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "PersonDetailViewController.h"


@implementation PersonDetailViewController
@synthesize imageButton;
@synthesize firstTextField;
@synthesize lastTextField;
@synthesize nickTextField;
@synthesize budgetSlider;
@synthesize cancelButtonItem;
@synthesize person = _person;
@synthesize saveButtonItem;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

-(id) initWithPersonOrNil:(Person *)person nibNameOrNil:(NSString *)nibNameOrNil bundleOrNil:(NSBundle *)nibBundleOrNil
{
    self = [self initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    self.person = person;
    return self;
}

- (void)dealloc
{
    [_person release];
    [imageButton release];
    [firstTextField release];
    [lastTextField release];
    [nickTextField release];
    [budgetSlider release];
    [saveButtonItem release];
    [cancelButtonItem release];
    [super dealloc];
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    if(self.person)
    {
        self.firstTextField.text = self.person.firstname;
        self.lastTextField.text = self.person.lastname;
        self.nickTextField.text = self.person.nickname;
        self.budgetSlider.value = [self.person.budget floatValue];
        [self.imageButton setImage:self.person.image forState:UIControlStateNormal];
    }
    
    self.navigationItem.leftBarButtonItem = self.cancelButtonItem;
    self.navigationItem.rightBarButtonItem = self.saveButtonItem;
}

- (void)viewDidUnload
{
    [self setImageButton:nil];
    [self setFirstTextField:nil];
    [self setLastTextField:nil];
    [self setNickTextField:nil];
    [self setBudgetSlider:nil];
    [self setSaveButtonItem:nil];
    [self setCancelButtonItem:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}


-(IBAction) saveButtonItemDidActivate:(id)sender
{
    if(self.person){
        self.person.firstname = self.firstTextField.text;
        self.person.lastname = self.lastTextField.text;
        self.person.nickname = self.nickTextField.text;
        self.person.budget = [NSNumber numberWithFloat:self.budgetSlider.value ];
        self.person.image = [imageButton imageForState:UIControlStateNormal];
    } else {
        Person *p = [[Person alloc] initWithFirstname:self.firstTextField.text lastname:self.lastTextField.text nickname:self.nickTextField.text budget: [NSNumber numberWithFloat:self.budgetSlider.value ] image:[imageButton imageForState:UIControlStateNormal]];
        [[((ChristmasOrganizerSketchesAppDelegate *) [[UIApplication sharedApplication] delegate]) persons] addObject:p];
        [p release];
    }
    [((ChristmasOrganizerSketchesAppDelegate *) [[UIApplication sharedApplication] delegate]) reloadPeopleTableViewController];
    
    [self.navigationController popViewControllerAnimated:YES];
}

-(IBAction) cancelButtonItemDidActivate:(id)sender
{
    [self.navigationController popViewControllerAnimated:YES];
}

-(BOOL) textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}

-(IBAction)imageButtonClicked:(id)sender
{
    [self startMediaBrowserFromViewController:self usingDelegate:self];
}

- (BOOL) startMediaBrowserFromViewController: (UIViewController*) controller
                               usingDelegate: (id <UIImagePickerControllerDelegate,
                                               UINavigationControllerDelegate>) delegate {
    if (([UIImagePickerController isSourceTypeAvailable:
          UIImagePickerControllerSourceTypeSavedPhotosAlbum] == NO)
        || (delegate == nil)
        || (controller == nil))
    {
        return NO;
    }
    
    UIImagePickerController *mediaUI = [[UIImagePickerController alloc] init];
    mediaUI.sourceType = UIImagePickerControllerSourceTypeSavedPhotosAlbum;
    
    // Displays saved pictures and movies, if both are available, from the
    // Camera Roll album.
    mediaUI.mediaTypes =
    [UIImagePickerController availableMediaTypesForSourceType:
     UIImagePickerControllerSourceTypeSavedPhotosAlbum];
    
    
    // Hides the controls for moving & scaling pictures, or for
    // trimming movies. To instead show the controls, use YES.
    mediaUI.allowsEditing = YES;
    
    mediaUI.delegate = delegate;
    
    [controller presentModalViewController: mediaUI animated: YES];
    
    return YES;
    
}

#pragma mark - UIImagePickerController

-(void) imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    UIImage* selectedImage = [info objectForKey:UIImagePickerControllerEditedImage];
    if(!selectedImage){
        selectedImage = [info objectForKey:UIImagePickerControllerOriginalImage];
    }
    
    [self.imageButton setImage:selectedImage forState:UIControlStateNormal];
    [[picker parentViewController] dismissModalViewControllerAnimated:YES];
    [picker release];
}


@end
