
//
//  FirstViewController.m
//  SampleTabBar
//
//  Created by Nilesh Agrawal on 8/2/15.
//  Copyright (c) 2015 Nilesh Agrawal. All rights reserved.
//

#import "FirstViewController.h"
#import "RESideMenu.h"

@interface FirstViewController ()

@end

@implementation FirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)leftAction:(id)sender {
    [self.sideMenuViewController presentLeftMenuViewController];
}

@end
