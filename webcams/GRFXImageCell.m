//
//  GRFXImageCell.m
//  webcams
//
//  Created by Adilet Abylov on 14.08.12.
//  Copyright (c) 2012 Adilet Abylov. All rights reserved.
//

#import "GRFXImageCell.h"
#import <SDWebImage/SDWebImageDownloader.h>
#import <SDWebImage/SDImageCache.h>

@implementation GRFXImageCell

@synthesize image;
@synthesize title;
@synthesize imageURL;
@synthesize activityIndicator;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
}

- (void)loadImageAsync:(NSString *) imageURLString
{
    UIImage *cachedImage = [[SDImageCache sharedImageCache] imageFromKey:imageURLString];
    if( cachedImage == nil )
    {
        image.alpha = 0;
        [SDWebImageDownloader downloaderWithURL:[NSURL URLWithString:imageURLString] delegate: self];
        [activityIndicator startAnimating];
    }else
    {
        [self.image setImage:cachedImage];
    }
    imageURL = imageURLString;
    
}

- (void)imageDownloaderDidFinish:(SDWebImageDownloader *)downloader
{
    UIImage *imageT = [[UIImage alloc] initWithData:downloader.imageData];
    [self.image setImage:imageT];
    [[SDImageCache sharedImageCache] storeImage:imageT forKey:imageURL toDisk:NO];
    [UIView beginAnimations:@"fadeIn" context:nil];
    image.alpha = 1;
    [UIView setAnimationDuration:1];
    
    [UIView commitAnimations];
    [activityIndicator stopAnimating];
    
}

- (void) imageDownloader:(SDWebImageDownloader *)downloader didFailWithError:(NSError *)error
{
    [activityIndicator stopAnimating];
}


@end
