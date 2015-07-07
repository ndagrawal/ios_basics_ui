//
//  CustomView.m
//  ViewHierarchyDemo
//
//  Created by Nilesh Agrawal on 7/7/15.
//  Copyright (c) 2015 Nilesh Agrawal. All rights reserved.
//

#import "CustomView.h"

@implementation CustomView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

/* Use this method when you need to load your subview through program */

-(id)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if(self){
        
    }
    return self;
}

/*Use this method when you need to load your subview through storyboard.*/
-(id)initWithCoder:(NSCoder *)aDecoder{
    self = [super initWithCoder:aDecoder];
    if(self){
        //1. Load the view from the Nib file
        
        [[NSBundle mainBundle]loadNibNamed:@"CustomView" owner:self options:nil];
        
        //2. Add those view to the superview
        [self addSubview:self.sampleview];
    }
    return self;
}

-(IBAction)buttonClicked:(id)sender{
    [self.delegate buttonISClicked];
}


@end
