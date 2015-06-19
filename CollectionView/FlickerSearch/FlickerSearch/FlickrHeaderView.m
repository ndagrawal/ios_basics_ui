//
//  FlickrHeaderView.m
//  FlickerSearch
//
//  Created by Nilesh Agrawal on 6/18/15.
//  Copyright (c) 2015 Nilesh Agrawal. All rights reserved.
//

#import "FlickrHeaderView.h"

@interface FlickrHeaderView()
@property (weak) IBOutlet UIImageView *backgroundImageView;
@property (weak) IBOutlet UILabel *searchLabel;

@end

@implementation FlickrHeaderView
-(void)setSearchText:(NSString *)text {
    self.searchLabel.text = text;
    UIImage *shareButtonImage = [[UIImage imageNamed:@"header_bg.png"] resizableImageWithCapInsets:
                                 UIEdgeInsetsMake(68, 68, 68, 68)];
    self.backgroundImageView.image = shareButtonImage;
    self.backgroundImageView.center = self.center;
}
@end
