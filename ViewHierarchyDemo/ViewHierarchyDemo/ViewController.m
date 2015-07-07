//
//  ViewController.m
//  ViewHierarchyDemo
//
//  Created by Nilesh Agrawal on 7/7/15.
//  Copyright (c) 2015 Nilesh Agrawal. All rights reserved.
//

#import "ViewController.h"
#import "CustomView.h"


@interface ViewController ()<CustomViewDelegate>

@property CustomView *customView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    //Line reuired while adding through the storyboard
    _customView  = [[CustomView alloc] init];
    
    //Line required while adding through storyboard and program
    _customView.center = CGPointMake(200, 300);
    _customView.delegate =self;
    
    [self.view addSubview:_customView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)buttonISClicked{
    NSLog(@"button is clicked");
}


@end
