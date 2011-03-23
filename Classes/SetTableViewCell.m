//
//  SetTableViewCell.m
//  Repper-iOS
//
//  Created by Anthony Lukasavage on 3/16/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "SetTableViewCell.h"


@implementation SetTableViewCell
@synthesize weightText;
@synthesize repText;
@synthesize webView;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code.
    }
    return self;
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state.
}


- (void)dealloc {
    [super dealloc];
}


@end
