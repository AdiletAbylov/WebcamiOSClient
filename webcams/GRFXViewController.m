//
//  GRFXViewController.m
//  webcams
//
//  Created by Adilet Abylov on 14.08.12.
//  Copyright (c) 2012 Adilet Abylov. All rights reserved.
//

#import "GRFXViewController.h"
#import "GRFXImageCell.h"
#import "KTPhotoScrollViewController.h"
#import "ImageDataSource.h"
#import <SDWebImage/SDImageCache.h>

@interface GRFXViewController ()

@end

@implementation GRFXViewController
@synthesize feedTable;
@synthesize feedData;

- (void)viewDidLoad
{
    [self showFeed];
    [super viewDidLoad];
}

- (void)viewDidUnload
{
    [self setFeedTable:nil];
    [super viewDidUnload];
    
    // Release any retained subviews of the main view.
}

- (void) showFeed
{
    NSString *path = [[NSBundle mainBundle] pathForResource:@"feed" ofType:@"plist"];
    feedData = [[NSArray alloc] initWithContentsOfFile:path];
    
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
        return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
    } else {
        return YES;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *cellID = @"ImageCell";
    GRFXImageCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if(cell == nil)
    {
        cell  = [[GRFXImageCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
    }else
    {
        [cell.image setImage:nil];
    }
    cell.title.text = [[feedData objectAtIndex:indexPath.row] objectForKey:@"title"];
    [cell loadImageAsync:[[feedData objectAtIndex:indexPath.row] objectForKey:@"url"]];     
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    ImageDataSource *source = [[ImageDataSource alloc] init];
    NSString *imageKey = [[feedData objectAtIndex:indexPath.row] objectForKey:@"url"];
    UIImage *cachedImage = [[SDImageCache sharedImageCache] imageFromKey:imageKey];
    [source setImage:cachedImage];
    KTPhotoScrollViewController *photoViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"detail"];
    photoViewController = [photoViewController initWithDataSource:source andStartWithPhotoAtIndex:0];
    [self.navigationController pushViewController:photoViewController animated:YES];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [feedData count];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    
}
@end
