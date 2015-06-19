//
//  FlickerViewCell.h
//  FlickerSearch
//
//  Created by Nilesh Agrawal on 6/18/15.
//  Copyright (c) 2015 Nilesh Agrawal. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FlickrPhoto.h"
@class FlickrPhoto;

@interface FlickerViewCell : UICollectionViewCell
@property (nonatomic, strong) IBOutlet UIImageView *imageView;
@property (nonatomic, strong) FlickrPhoto *photo;
-(void) setPhoto:(FlickrPhoto *)photo;

@end
