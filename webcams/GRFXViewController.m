//
//  GRFXViewController.m
//  webcams
//
//  Created by Adilet Abylov on 14.08.12.
//  Copyright (c) 2012 Adilet Abylov. All rights reserved.
//

#import "GRFXViewController.h"

@interface GRFXViewController ()

@end

@implementation GRFXViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
        return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
    } else {
        return YES;
    }
}

@end
