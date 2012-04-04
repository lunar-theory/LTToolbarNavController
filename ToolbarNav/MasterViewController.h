//
//  MasterViewController.h
//  ToolbarNav
//
//  Created by David Wheeler on 3/28/12.
//  Copyright (c) 2012 iovation. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MasterViewController : UIViewController

@property (nonatomic, strong) IBOutlet UIScrollView *scrollView;

- (IBAction)goButtonTapped:(id)sender;

@end
