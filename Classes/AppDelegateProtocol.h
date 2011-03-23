//
//  AppDelegateProtocol.h
//  ViewControllerDataSharing
//
//  Created by Duncan Champney on 7/29/10.
//

#import <UIKit/UIKit.h>

@class AppDataObject;

@protocol AppDelegateProtocol

- (AppDataObject*) theAppDataObject;

@end
