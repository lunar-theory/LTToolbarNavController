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
    NSMutableArray *imageViews;
}
@end

@implementation MasterViewController
@synthesize scrollView;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = NSLocalizedString(@"Master", @"Master");
        imageViews = [NSMutableArray arrayWithCapacity:3];
    }
    return self;
}
							
- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor
        colorWithPatternImage:[UIImage imageNamed:@"background.png"]
    ];
}

#define PADDING  20

- (void)viewDidAppear:(BOOL)animated {

    NSArray *names = [NSArray arrayWithObjects:
        @"blossoms.jpg",
        @"gadsby.jpg",
        @"hello.jpg",
        nil
    ];

    CGFloat contentHeight = 0;
    CGSize scrollSize = self.scrollView.bounds.size;
    for (NSString *fn in names) {
        UIImage *img = [UIImage imageNamed:fn];
        UIImageView *iv = [[UIImageView alloc]initWithImage:img];
        iv.contentMode = UIViewContentModeScaleAspectFit;
        iv.autoresizingMask = UIViewAutoresizingFlexibleWidth;
        contentHeight += PADDING;
        CGSize imgSize = img.size;
        iv.frame = CGRectMake(
            0,
            contentHeight,
            scrollSize.width,
            imgSize.height
        );
        [self.scrollView addSubview:iv];
        [imageViews addObject:iv];
        contentHeight += imgSize.height;
    }
    
    self.scrollView.contentSize = CGSizeMake(
        self.scrollView.bounds.size.width,
        contentHeight + PADDING
    );
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
