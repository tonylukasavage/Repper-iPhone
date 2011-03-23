//
//  RepsViewController.h
//  Repper-iOS
//
//  Created by Anthony Lukasavage on 3/14/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface RepsViewController : UIViewController <UITableViewDataSource, UITableViewDelegate> {
	UITableView *setTableView;
	NSMutableArray *setList;
}

@property (nonatomic, retain) IBOutlet UITableView *setTableView;
@property (nonatomic, retain) NSMutableArray *setList;

@end
