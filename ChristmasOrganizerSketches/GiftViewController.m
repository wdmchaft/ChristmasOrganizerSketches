//
//  GiftViewController.m
//  ChristmasOrganizerSketches
//
//  Created by Simon Meurer on 16.06.11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "GiftViewController.h"


@implementation GiftViewController
@synthesize imageButton;
@synthesize boughtSwitch;
@synthesize saveButtonItem;
@synthesize cancelButtonItem;
@synthesize personTextField;
@synthesize placeTextField;
@synthesize priceTextField;
@synthesize nameTextField;
@synthesize gift = _gift;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        
    }
    return self;
}

-(id)initWithGiftOrNil:(Gift *)gift nibNameOrNil:(NSString *)nibNameOrNil bundleOrNil:(NSBundle *)nibBundleOrNil
{
    self = [self initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    
    self.gift = gift;
    
    return self;
}

- (void)dealloc
{
    [personTextField release];
    [placeTextField release];
    [priceTextField release];
    [nameTextField release];
    [cancelButtonItem release];
    [saveButtonItem release];
    [boughtSwitch release];
    [imageButton release];
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
    
    if(self.gift)
    {
        self.nameTextField.text = self.gift.name;
        self.priceTextField.text = [self.gift.price stringValue];
        self.placeTextField.text = self.gift.place;
        self.personTextField.text = self.gift.person;
        [self.boughtSwitch setOn:self.gift.bought];
        [self.imageButton setImage:self.gift.image forState:UIControlStateNormal];
    }
    
    self.navigationItem.leftBarButtonItem = self.cancelButtonItem;
    self.navigationItem.rightBarButtonItem = self.saveButtonItem;
}

- (void)viewDidUnload
{
    [self setPersonTextField:nil];
    [self setPlaceTextField:nil];
    [self setPriceTextField:nil];
    [self setNameTextField:nil];
    [self setCancelButtonItem:nil];
    [self setSaveButtonItem:nil];
    [self setBoughtSwitch:nil];
    [self setImageButton:nil];
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
    if(self.gift){
        self.gift.name = self.nameTextField.text;
        self.gift.price = [NSNumber numberWithInteger: [self.priceTextField.text integerValue]];
        self.gift.place = self.placeTextField.text;
        self.gift.person = self.personTextField.text;
        self.gift.bought = [boughtSwitch isOn];
        self.gift.image = [imageButton imageForState:UIControlStateNormal];
    } else {
        Gift *g = [[Gift alloc] initWithName:self.nameTextField.text place:self.placeTextField.text price:[NSNumber numberWithInteger: [self.priceTextField.text integerValue]] person:self.personTextField.text bought:[boughtSwitch isOn] image:[imageButton imageForState:UIControlStateNormal]];
        [[((ChristmasOrganizerSketchesAppDelegate *) [[UIApplication sharedApplication] delegate]) gifts] addObject:g];
        [g release];
    }
    [((ChristmasOrganizerSketchesAppDelegate *) [[UIApplication sharedApplication] delegate]) reloadGiftsTableViewController];
    
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

-(void) imagePickerController:(UIImagePickerController *)picker didFinishPickingImage:(UIImage *)image editingInfo:(NSDictionary *)editingInfo
{
    UIImage* selectedImage = [editingInfo objectForKey:UIImagePickerControllerEditedImage];
    if(!selectedImage){
        selectedImage = [editingInfo objectForKey:UIImagePickerControllerOriginalImage];
    }
    [self.imageButton setImage:selectedImage forState:UIControlStateNormal];
    [[picker parentViewController] dismissModalViewControllerAnimated:YES];
    [picker release];
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

@end
