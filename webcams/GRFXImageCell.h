//
//  GRFXImageCell.h
//  webcams
//
//  Created by Adilet Abylov on 14.08.12.
//  Copyright (c) 2012 Adilet Abylov. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <SDWebImage/SDWebImageDownloaderDelegate.h>

@interface GRFXImageCell : UITableViewCell <SDWebImageDownloaderDelegate>
@property (nonatomic, strong) IBOutlet UIImageView *image;
@property (nonatomic, strong) IBOutlet UILabel *title;
@property (nonatomic, strong) NSString *imageURL;
@property (nonatomic, strong) IBOutlet UIActivityIndicatorView *activityIndicator;

- (void)loadImageAsync:(NSString *) imageURLString;
@end
