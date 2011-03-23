//
//  MainViewController.h
//  Repper-iOS
//
//  Created by Anthony Lukasavage on 3/14/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RepsViewController.h"
#import "WeightTextFieldDelegate.h"

@interface MainViewController : UIViewController <UITextFieldDelegate, UIPickerViewDelegate, UIPickerViewDataSource> {
	RepsViewController *repsVC;
	UIButton *calculateButton;
	UIView *layoutView;
	UITableView *tableView;
	NSArray *options;
	
	UITextField *weightTextField;
	WeightTextFieldDelegate *weightTextFieldDelegate;
	
	UISegmentedControl *unitControl;
	
	UITextField *repTextField;
	UIPickerView *repPicker;
	NSMutableArray *repChoices;
	NSMutableArray *unitChoices;
}

@property (nonatomic, retain) IBOutlet RepsViewController *repsVC;
@property (nonatomic, retain) IBOutlet UIButton *calculateButton;
@property (nonatomic, retain) IBOutlet UITableView *tableView;
@property (nonatomic, retain) IBOutlet UIView *layoutView;
@property (nonatomic, retain) IBOutlet UITextField *repTextField;
@property (nonatomic, retain) IBOutlet UIPickerView *repPicker;
@property (nonatomic, retain) IBOutlet UITextField *weightTextField;
@property (nonatomic, retain) IBOutlet WeightTextFieldDelegate *weightTextFieldDelegate;
@property (nonatomic, retain) IBOutlet UISegmentedControl *unitControl;
@property (nonatomic, retain) NSArray *options;
-(IBAction)calculateReps;
-(IBAction)handleUnitControlTouch;

@end
