//
//  FlickerPhotoViewController.m
//  FlickerSearch
//
//  Created by Nilesh Agrawal on 6/18/15.
//  Copyright (c) 2015 Nilesh Agrawal. All rights reserved.
//

#import "FlickerPhotoViewController.h"
#import "Flickr.h"
#import "FlickrPhoto.h"

@interface FlickerPhotoViewController ()
@property (weak) IBOutlet UIImageView *imageView;
-(IBAction) done:(id)sender;
@end
@implementation FlickerPhotoViewController
@synthesize flickrPhoto = _flickrPhoto;


-(void)viewDidAppear:(BOOL)animated {
    // 1
    if(self.flickrPhoto.largeImage) {
        self.imageView.image = self.flickrPhoto.largeImage;
    } else {
        // 2
        self.imageView.image = self.flickrPhoto.thumbnail;
        // 3
        [Flickr loadImageForPhoto:self.flickrPhoto thumbnail:NO completionBlock:^(UIImage *photoImage, NSError *error) {
            if(!error) { // 4
                dispatch_async(dispatch_get_main_queue(), ^{ self.imageView.image =
                    self.flickrPhoto.largeImage;
                });
            }
        }];
    }
}


-(IBAction) done:(id)sender{
    //[self.presentingViewController dismissViewControllerAnimated:YES completion:^{}];
    
}




@end
