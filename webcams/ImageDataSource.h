//
//  ImageDataSource.h
//  webcams
//
//  Created by Adilet Abylov on 15.08.12.
//  Copyright (c) 2012 Adilet Abylov. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "KTPhotoBrowserDataSource.h"

@interface ImageDataSource : NSObject <KTPhotoBrowserDataSource>

-(void)setImage:(UIImage*) uiImage;
@property (nonatomic, strong) UIImage *image;

@end
