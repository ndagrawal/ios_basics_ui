//
//  CustomView.m
//  ViewHierarchyDemo
//
//  Created by Nilesh Agrawal on 7/7/15.
//  Copyright (c) 2015 Nilesh Agrawal. All rights reserved.
//

#import "CustomView.h"

@implementation CustomView

/* Use this method when you need to load your subview through program */
-(id)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if(self){
        //1.Load the view from the nib file
        [[NSBundle mainBundle] loadNibNamed:@"CustomView" owner:self options:nil];
        
        //2.Adjust bounds.
        NSLog(@"frame = %@",NSStringFromCGRect(self.sampleview.frame));
        NSLog(@"bounds = %@",NSStringFromCGRect(self.sampleview.bounds));
        
        //So that it loads the same bounds as the .xib frame.
        self.bounds = self.sampleview.bounds;
        
        //3.Add those view to superview
        [self addSubview:self.sampleview];
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
