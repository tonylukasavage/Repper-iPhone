//
//  RepsViewController.m
//  Repper-iOS
//
//  Created by Anthony Lukasavage on 3/14/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "RepsViewController.h"
#import "ExampleAppDataObject.h"
#import "AppDelegateProtocol.h"
#import "SetTableViewCell.h"
#import "RepperObject.h"

@implementation RepsViewController
@synthesize setTableView;
@synthesize setList;

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

- (ExampleAppDataObject*) theAppDataObject;
{
	id<AppDelegateProtocol> theDelegate = (id<AppDelegateProtocol>) [UIApplication sharedApplication].delegate;
	ExampleAppDataObject* theDataObject;
	theDataObject = (ExampleAppDataObject*) theDelegate.theAppDataObject;
	return theDataObject;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
	return [self.setList count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *CellIdentifier = @"Cell";
	
    //UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
	SetTableViewCell *cell = (SetTableViewCell*)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    //if (cell == nil) {
    //    cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
    //}
	
	if (cell == nil){
//		NSLog(@”New Cell Made”);
		
		
		NSArray *topLevelObjects = [[NSBundle mainBundle] loadNibNamed:@"SetTableViewCell" owner:nil options:nil];
		
		for(id currentObject in topLevelObjects)
		{
			if([currentObject isKindOfClass:[SetTableViewCell class]])
			{
				cell = (SetTableViewCell *)currentObject;
				break;
			}
		}
	}
	
	// Configure the cell.
	//cell.textLabel.text = [self.setList objectAtIndex: [indexPath row]];
	//cell.backgroundColor = [UIColor blueColor];
	cell.weightText.text = [[self.setList objectAtIndex: [indexPath row]] weight];
	cell.repText.text = [[self.setList objectAtIndex:[indexPath row]] reps];
	//[cell.webView loadHTMLString:cell.weightText.text baseURL:[NSURL URLWithString:@""]];
	
	ExampleAppDataObject *theDataObject = [self theAppDataObject];
	if ([theDataObject.reps isEqualToString:[  NSString stringWithFormat:@"%i", [indexPath row]+1   ]]) {
		[cell.contentView setBackgroundColor:[UIColor colorWithRed:0.9 green:0.9 blue:1.0 alpha:1.0]];
	}
	
	//[cell.contentView setBackgroundColor:[UIColor blueColor]];
    return cell;
}

// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
	self.title = @"You can probably lift...";
	setTableView.allowsSelection = NO;
    [super viewDidLoad];
}


-(void)viewWillAppear:(BOOL)animated {
	ExampleAppDataObject *theDataObject = [self theAppDataObject];
	
	NSNumberFormatter *formatter = [[NSNumberFormatter alloc] init];
	[formatter setNumberStyle:NSNumberFormatterDecimalStyle];
	float weightNumber = [[formatter numberFromString:theDataObject.weight] floatValue];
	int repNumber = [[formatter numberFromString:theDataObject.reps] intValue];
	[formatter release];
	
	if (self.setList == nil) {
		self.setList = [[NSMutableArray alloc] initWithCapacity:15];
		for (int i = 0; i < 15; i++ ) {
			[self.setList addObject:[[RepperObject alloc] init]];
		}
	}
	
	/*
	if ([theDataObject.unit isEqualToString:@"lb"]) {
		theDataObject.unit = @"pounds";
	} else if ([theDataObject.unit isEqualToString:@"kg"]) {
		theDataObject.unit = @"kilograms";
	} else if ([theDataObject.unit isEqualToString:@"st"]) {
		theDataObject.unit = @"stone";
	}
	 */
	
	for (int i = 0; i < 15; i++) {
		float currentValue = [[theDataObject.repArray objectAtIndex:i] floatValue];
		float targetValue = [[theDataObject.repArray objectAtIndex:repNumber-1] floatValue];
		float finalValue = weightNumber + ((currentValue - targetValue) * weightNumber);
		
		RepperObject *repper = [setList objectAtIndex:i];
		repper.reps = [NSString stringWithFormat:@"%i", i+1];
		
		if ([theDataObject.unit isEqualToString:@"st"]) {
			repper.weight = [NSString stringWithFormat:@"%.1f %@", finalValue, theDataObject.unit];
			//[setList replaceObjectAtIndex:i withObject:[NSString stringWithFormat:@"%.1f %@ for %i reps", finalValue, theDataObject.unit, i+1]];
		} else {
			repper.weight = [NSString stringWithFormat:@"%i %@", (int)round(finalValue), theDataObject.unit];
			//[setList replaceObjectAtIndex:i withObject:[NSString stringWithFormat:@"%i %@ for %i reps", (int)round(finalValue), theDataObject.unit, i+1]];
		}
		
	}
	
	[setTableView reloadData];
	
	//[setTableView 
	//[setTableView selectRowAtIndexPath:[NSIndexPath indexPathForRow:repNumber-1 inSection:0] animated:NO scrollPosition:0];
}


- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    return (interfaceOrientation == UIInterfaceOrientationPortrait ||
			interfaceOrientation == UIInterfaceOrientationPortraitUpsideDown);
}

- (void)didReceiveMemoryWarning {
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc. that aren't in use.
}

- (void)viewDidUnload {
	self.setList = nil;
    [super viewDidUnload];
}


- (void)dealloc {
	[setList release];
    [super dealloc];
}


@end
