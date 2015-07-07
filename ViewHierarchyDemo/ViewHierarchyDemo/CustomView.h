//
//  CustomView.h
//  ViewHierarchyDemo
//
//  Created by Nilesh Agrawal on 7/7/15.
//  Copyright (c) 2015 Nilesh Agrawal. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol CustomViewDelegate <NSObject>

@required
//This method must be implemented by the view controller which implements this protocol
-(void)buttonISClicked;
@end
@interface CustomView : UIView
@property (strong, nonatomic) IBOutlet UIView *sampleview;
@property (weak, nonatomic) IBOutlet UILabel *label;
@property (weak, nonatomic) IBOutlet UIButton *button;
@property (assign) id<CustomViewDelegate> delegate;
@end
