//
//  WeightTextFieldDelegate.m
//  Repper-iOS
//
//  Created by Anthony Lukasavage on 3/15/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "WeightTextFieldDelegate.h"


@implementation WeightTextFieldDelegate

-(BOOL)textFieldShouldReturn:(UITextField *)textField {
	[textField resignFirstResponder];
	
	return YES;
}

@end
