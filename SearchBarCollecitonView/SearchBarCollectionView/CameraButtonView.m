//
//  CameraButtonView.m
//  ViewHierarchyDemo
//
//  Created by Nilesh Agrawal on 7/6/15.
//  Copyright (c) 2015 Nilesh Agrawal. All rights reserved.
//

#import "CameraButtonView.h"

@implementation CameraButtonView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/


-(id)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if(self){
        //Initialization code
        //1. Load .xib
         [[NSBundle mainBundle] loadNibNamed:@"button" owner:self options:nil];
        //2.Adjust bounds.
         NSLog(@"frame = %@",NSStringFromCGRect(self.cameraButtonView.frame));
         NSLog(@"bounds = %@",NSStringFromCGRect(self.cameraButtonView.bounds));
        //So that it loads the same bounds as the .xib frame.
         self.bounds = self.cameraButtonView.bounds;
        
        //3. add as a subview.
        [self addSubview:self.cameraButtonView];
   
        
    }
    return self;
}


//Used when added through storyboard
-(id)initWithCoder:(NSCoder *)aDecoder{
    self = [super initWithCoder:aDecoder];
    if(self){
        //1. Load the interface from the file from .xib
        [[NSBundle mainBundle] loadNibNamed:@"button" owner:self options:nil];
        
        //Add as a subview.
        [self addSubview:self.cameraButtonView];
    }
    return self;
}
- (IBAction)someAction:(id)sender {
    [self.delegate didButtonPressed];
}
@end
