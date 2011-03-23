//
//  SetTableViewCell.h
//  Repper-iOS
//
//  Created by Anthony Lukasavage on 3/16/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface SetTableViewCell : UITableViewCell {
	UILabel *weightText;
	UILabel *repText;
	UIWebView *webView;
}

@property (nonatomic, retain) IBOutlet UILabel *weightText;
@property (nonatomic, retain) IBOutlet UILabel *repText;
@property (nonatomic, retain) IBOutlet UIWebView *webView;

@end
