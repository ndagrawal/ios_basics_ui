//
//  AppDelegate.m
//  UIViewClass
//
//  Created by Nilesh Agrawal on 7/8/15.
//  Copyright (c) 2015 Nilesh Agrawal. All rights reserved.
//

#import "AppDelegate.h"
#import "HypnosisView.h"

@interface AppDelegate ()


@end

@implementation AppDelegate
@synthesize window = _window;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    //Make a CGRectThat is the size of the window;
    CGRect wholeWindow = [[self window] bounds];
    
    /* -- Adding ScrollView -- */
    
    UIScrollView *scrollView = [[UIScrollView alloc] initWithFrame:wholeWindow];
    [[self window] addSubview:scrollView];
    // Make your view twice as large as the window
    
    CGRect reallyBigRect;
    reallyBigRect.origin = CGPointZero;
    reallyBigRect.size.width = wholeWindow.size.width * 2.0;
    reallyBigRect.size.height = wholeWindow.size.height * 2.0;
    [scrollView setContentSize:reallyBigRect.size];
    // Center it in the scroll view
    //Offset means center of the view inside the hypnosisview
    CGPoint offset;
    offset.x = wholeWindow.size.width * 0.5;
    offset.y = wholeWindow.size.height * 0.5;
    offset.x=0.0;
    offset.y=0.0;
    [scrollView setContentOffset:offset];
    
    // Create the view
    [scrollView setMinimumZoomScale:0.5];
    [scrollView setMaximumZoomScale:5];
    [scrollView setDelegate:self];

    
    hypnosisView = [[HypnosisView alloc] initWithFrame:reallyBigRect];
    [hypnosisView setBackgroundColor:[UIColor clearColor]];
    [scrollView addSubview:hypnosisView];
    [[UIApplication sharedApplication] setStatusBarHidden:YES
                                            withAnimation:UIStatusBarAnimationFade];
    [[self window] makeKeyAndVisible];
    [self.window bringSubviewToFront: scrollView];

    
    return YES;
}

- (UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView
{
    return hypnosisView;
}



- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
