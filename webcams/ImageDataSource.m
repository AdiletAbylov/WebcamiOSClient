//
//  ImageDataSource.m
//  webcams
//
//  Created by Adilet Abylov on 15.08.12.
//  Copyright (c) 2012 Adilet Abylov. All rights reserved.
//

#import "ImageDataSource.h"


@implementation ImageDataSource 
@synthesize image;


-(void)setImage:(UIImage *)uiImage
{
    image = uiImage;
}

-(UIImage *)imageAtIndex:(NSInteger)index
{
    return image;
}

- (NSInteger)numberOfPhotos
{
    return 1;
}

@end
