//
//  Repper_iOSAppDelegate.h
//  Repper-iOS
//
//  Created by Anthony Lukasavage on 3/14/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegateProtocol.h"


@class ExampleAppDataObject;

@interface Repper_iOSAppDelegate : NSObject <UIApplicationDelegate, AppDelegateProtocol> {
    UIWindow *window;
	UINavigationController *navigationController;
	ExampleAppDataObject *theAppDataObject;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet UINavigationController *navigationController;

@property (nonatomic, retain) ExampleAppDataObject* theAppDataObject;

@end

