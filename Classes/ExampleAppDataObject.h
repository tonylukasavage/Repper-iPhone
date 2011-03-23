//
//  ExampleAppDataObject.h
//  ViewControllerDataSharing
//
//  Created by Duncan Champney on 7/29/10.

#import <Foundation/Foundation.h>
#import "AppDataObject.h"


@interface ExampleAppDataObject : AppDataObject 
{
	NSString *weight;
	NSString *reps;
	NSString *unit;
	NSArray *repArray;
}

@property (nonatomic, copy) NSString* weight;
@property (nonatomic, copy) NSString* reps;
@property (nonatomic, copy) NSString *unit;
@property (nonatomic, copy) NSArray *repArray;

@end
