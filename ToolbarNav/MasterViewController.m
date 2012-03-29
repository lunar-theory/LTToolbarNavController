//
//  MasterViewController.m
//  ToolbarNav
//
//  Created by David Wheeler on 3/28/12.
//  Copyright (c) 2012 iovation. All rights reserved.
//

#import "MasterViewController.h"
#import "LTToolbarNavViewController.h"

@interface MasterViewController () {
    NSMutableArray *_objects;
}
@end

@implementation MasterViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = NSLocalizedString(@"Master", @"Master");
    }
    return self;
}
							
- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"background.png"]];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return YES;
}

- (void)goButtonTapped:(id)sender {
    CGFloat toolbarHeight = self.toolbar.frame.size.height;
    [UIView animateWithDuration:0.2 animations:^{
        CGRect navToolbarFrame = self.toolbar.frame;
        navToolbarFrame.origin.y += toolbarHeight;
        self.toolbar.frame = navToolbarFrame;
    } completion:^(BOOL finished) {
        [UIView animateWithDuration:0.2 animations:^{
            CGRect navToolbarFrame = self.toolbar.frame;
            navToolbarFrame.origin.y -= toolbarHeight;
            self.toolbar.frame = navToolbarFrame;
        }];
    }];

}

@end
