//
//  CameraButtonView.h
//  ViewHierarchyDemo
//
//  Created by Nilesh Agrawal on 7/6/15.
//  Copyright (c) 2015 Nilesh Agrawal. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol CustomViewDelegate <NSObject>

-(void)didButtonPressed;

@end


@interface CameraButtonView : UIView
@property (strong, nonatomic) IBOutlet UIView *cameraButtonView;
@property (strong, nonatomic) IBOutlet UIView *cameraButton;
@property (assign) id<CustomViewDelegate> delegate;
@end
