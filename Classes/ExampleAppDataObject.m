//
//  ExampleAppDataObject.m
//  ViewControllerDataSharing
//
//  Created by Duncan Champney on 7/29/10.

#import "ExampleAppDataObject.h"


@implementation ExampleAppDataObject
@synthesize weight, reps, unit, repArray;

#pragma mark -
#pragma mark -Memory management methods

- (id) init
{
	self = [super init];
	if (self != nil) {
		self.repArray = [NSArray arrayWithObjects:
						 [NSNumber numberWithFloat:1.00],
						 [NSNumber numberWithFloat:0.94],
						 [NSNumber numberWithFloat:0.91],
						 [NSNumber numberWithFloat:0.88333],
						 [NSNumber numberWithFloat:0.86],
						 [NSNumber numberWithFloat:0.83333],
						 [NSNumber numberWithFloat:0.805],
						 [NSNumber numberWithFloat:0.77666],
						 [NSNumber numberWithFloat:0.751666],
						 [NSNumber numberWithFloat:0.7333],
						 [NSNumber numberWithFloat:0.701666],
						 [NSNumber numberWithFloat:0.675],
						 [NSNumber numberWithFloat:0.655],
						 [NSNumber numberWithFloat:0.6375],
						 [NSNumber numberWithFloat:0.625],
						 nil];
	}
	return self;
}

- (void)dealloc 
{
	//Release any properties declared as retain or copy.
	self.weight = nil;
	self.reps = nil;
	self.unit = nil;
	[repArray release];
	[super dealloc];
}
@end
