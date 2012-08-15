//
//  GRFXViewController.h
//  webcams
//
//  Created by Adilet Abylov on 14.08.12.
//  Copyright (c) 2012 Adilet Abylov. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GRFXViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *feedTable;
@property (nonatomic, retain) NSArray *feedData;

@end
