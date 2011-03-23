//
//  MainViewController.m
//  Repper-iOS
//
//  Created by Anthony Lukasavage on 3/14/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "MainViewController.h"
#import "WeightTextFieldDelegate.h"
#import <QuartzCore/QuartzCore.h>
#import "ExampleAppDataObject.h"
#import "AppDelegateProtocol.h"

@implementation MainViewController
@synthesize calculateButton;
@synthesize repsVC;
@synthesize options;
@synthesize tableView;
@synthesize repPicker;
@synthesize weightTextField;
@synthesize weightTextFieldDelegate;
@synthesize layoutView;
@synthesize unitControl, repTextField;

- (ExampleAppDataObject*) theAppDataObject;
{
	id<AppDelegateProtocol> theDelegate = (id<AppDelegateProtocol>) [UIApplication sharedApplication].delegate;
	ExampleAppDataObject* theDataObject;
	theDataObject = (ExampleAppDataObject*) theDelegate.theAppDataObject;
	return theDataObject;
}

-(IBAction)calculateReps {
	[weightTextField resignFirstResponder];
	repPicker.hidden = YES;
	
	ExampleAppDataObject *theDataObject = [self theAppDataObject];
	theDataObject.weight = weightTextField.text;
	theDataObject.reps = repTextField.text;
	theDataObject.unit = [unitControl titleForSegmentAtIndex:[unitControl selectedSegmentIndex]];
	
	UIAlertView *inputError;
	NSNumberFormatter *f = [[NSNumberFormatter alloc] init];
	[f setNumberStyle:NSNumberFormatterDecimalStyle];
	if ([f numberFromString:theDataObject.weight] == nil) {
		inputError = [[UIAlertView alloc] initWithTitle:@"Input Error" message:@"Invalid value for weight" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
		[inputError show];
		[inputError release];
		return;
	} else if ([f numberFromString:theDataObject.reps] == nil) {
		inputError = [[UIAlertView alloc] initWithTitle:@"Input Error" message:@"Invalid value for # of reps" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
		[inputError show];
		[inputError release];
		return;
	}
	[f release];
	
	
	
	if (self.repsVC == nil) {
		RepsViewController *rvc = [[RepsViewController alloc] initWithNibName:@"RepsViewController" bundle:[NSBundle mainBundle]];
		self.repsVC = rvc;
		[rvc release];
	}
	
	[self.navigationController pushViewController:self.repsVC animated:YES];
}

-(IBAction) handleUnitControlTouch {
	[weightTextField resignFirstResponder];
	repPicker.hidden = YES;
}
// The designated initializer.  Override if you create the controller programmatically and want to perform customization that is not appropriate for viewDidLoad.
/*
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization.
    }
    return self;
}
*/

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    return (interfaceOrientation == UIInterfaceOrientationPortrait ||
			interfaceOrientation == UIInterfaceOrientationPortraitUpsideDown);
}



- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField {
	//repPicker.hidden = NO;
	[weightTextField resignFirstResponder];
	[self.view bringSubviewToFront:self.repPicker];
	repPicker.hidden = NO;
	return NO;
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField {
	[textField resignFirstResponder];
	return YES;
}

-(void)viewWillAppear:(BOOL)animated {
	self.navigationController.navigationBarHidden = YES;
}

-(void)viewWillDisappear:(BOOL)animated {
	self.navigationController.navigationBarHidden = NO;
}

// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
	[super viewDidLoad];
	//self.navigationItem.title = @"Repper";
	self.title = @"Home";
	
	UIImage *calcImage = [UIImage imageNamed:@"calculateButon.png"];
	UIImage *buttonImage = [calcImage stretchableImageWithLeftCapWidth:12.0 topCapHeight:0.0];
	[calculateButton setBackgroundImage:buttonImage forState:UIControlStateNormal];
	//[calculateButton setBackgroundColor:[UIColor clearColor]];
	
	/*
	CAGradientLayer *gl = [[CAGradientLayer alloc] init];
	[gl setBounds:[calculateButton bounds]];
	[gl setPosition:CGPointMake([calculateButton bounds].size.width/2, [calculateButton bounds].size.height/2)];
	[gl setColors:
	 [NSArray arrayWithObjects:
	  (id)[[UIColor redColor] CGColor], 
	  (id)[[UIColor blueColor] CGColor], nil]];
	[self.calculateButton.layer insertSublayer:gl atIndex:0];
	[calculateButton.layer setMasksToBounds:YES];
	[calculateButton.layer setNeedsDisplay];
	*/
	
	self.layoutView.layer.cornerRadius = 10;
	weightTextFieldDelegate = [[WeightTextFieldDelegate alloc] init];
	
	self.weightTextField.delegate = weightTextFieldDelegate;
	repChoices = [[NSMutableArray alloc] init];
	int i;
	for (i = 1; i <= 15; i++) {
		[repChoices addObject:[NSString stringWithFormat:@"%d", i]];
	}
	
	//self.tableView.backgroundColor = [UIColor clearColor];
	layoutView.layer.borderColor = [UIColor blackColor].CGColor;
	layoutView.layer.borderWidth = 2.0f;
	[[layoutView layer] setShadowColor:[UIColor blackColor].CGColor];
	[[layoutView layer] setShadowOpacity:1.0f];
	[[layoutView layer] setShadowRadius:10.0f];
	[[layoutView layer] setShadowOffset:CGSizeMake(0, 3)];
	
	
	
	self.options = [[NSArray alloc] initWithObjects:@"Units", @"# of reps", nil];
    
}



- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView;
{
    return 1;
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    //mlabel.text=    [arrayNo objectAtIndex:row];
	repTextField.text = [repChoices objectAtIndex:row];
	pickerView.hidden = YES;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component;
{
    return [repChoices count];
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component;
{
    return [repChoices objectAtIndex:row];
}



- (void)didReceiveMemoryWarning {
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc. that aren't in use.
}

- (void)viewDidUnload {
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}


- (void)dealloc {
	[self.weightTextFieldDelegate release];
	[self.options release];
    [super dealloc];
}


@end
