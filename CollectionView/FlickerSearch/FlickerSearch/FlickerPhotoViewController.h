//
//  FlickerPhotoViewController.h
//  FlickerSearch
//
//  Created by Nilesh Agrawal on 6/18/15.
//  Copyright (c) 2015 Nilesh Agrawal. All rights reserved.
//

#import <UIKit/UIKit.h>
    
@class FlickrPhoto;

@interface FlickerPhotoViewController : UICollectionView
@property (nonatomic,strong) FlickrPhoto *flickrPhoto;

@end
