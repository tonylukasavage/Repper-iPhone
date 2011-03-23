//
//  RepperObject.h
//  Repper-iOS
//
//  Created by Anthony Lukasavage on 3/17/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface RepperObject : NSObject {
	NSString *weight;
	NSString *reps;
}

@property (nonatomic, retain) NSString *weight;
@property (nonatomic, retain) NSString *reps;

@end
