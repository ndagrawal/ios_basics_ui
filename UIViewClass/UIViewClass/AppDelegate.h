//
//  AppDelegate.h
//  UIViewClass
//
//  Created by Nilesh Agrawal on 7/8/15.
//  Copyright (c) 2015 Nilesh Agrawal. All rights reserved.
//

#import <UIKit/UIKit.h>
@class HypnosisView;
@interface AppDelegate : UIResponder <UIApplicationDelegate,UIScrollViewDelegate>{
    HypnosisView *hypnosisView;
}

@property (strong, nonatomic) UIWindow *window;


@end

