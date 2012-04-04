//
//  LTToolbarNavViewController.m
//  ToolbarNav
//
//  Created by David Wheeler on 3/28/12.
//  Copyright (c) 2012 iovation. All rights reserved.
//

#import "LTToolbarNavViewController.h"
#import <objc/runtime.h>

static char *toolbarNavControllerKey = "LTToolbarNavController";
static char *toolbarItemsKey = "LTToolbarNavControllerToolbarItems";

@interface LTToolbarNavViewController ()
@property(nonatomic,readwrite,strong) NSArray *viewControllers;
@property(nonatomic,readwrite,strong) UIViewController *topViewController;
@end

@implementation LTToolbarNavViewController

@synthesize toolbar;
@synthesize viewControllers;
@synthesize topViewController;

- (id)init {
    if (self = [super init]) {
        CGFloat statusBarHeight = UIApplication.sharedApplication.statusBarFrame.size.height;
        self.toolbar = [[UIToolbar alloc]initWithFrame:CGRectMake(0, 1024 - (44 + statusBarHeight), 768, 44)];
        self.toolbar.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleTopMargin;
    }
    return self;
}

- (id)initWithRootViewController:(UIViewController *)rootViewController {
    if (self = [self init]) {
        objc_setAssociatedObject(rootViewController, &toolbarNavControllerKey, self, OBJC_ASSOCIATION_RETAIN);
        self.viewControllers = [NSMutableArray arrayWithObject:rootViewController];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.toolbar];
    if (self.viewControllers.count > 0) {
        self.topViewController = [self.viewControllers objectAtIndex:0];
        // Must access the view in order for toolbarItems to be populated.
        [self.view insertSubview:topViewController.view belowSubview:self.toolbar];
        self.toolbar.items = topViewController.toolbarItems;
    }
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    if (self.topViewController == nil) {
        return interfaceOrientation == UIInterfaceOrientationPortrait;
    }
    return [self.topViewController shouldAutorotateToInterfaceOrientation:interfaceOrientation];
}

@end


@implementation UIViewController (LTToolbarNavViewControllerItem)

- (LTToolbarNavViewController *)toolbarNavController {
    return objc_getAssociatedObject(self, &toolbarNavControllerKey);
}

- (void)setToolbarItems:(NSArray *)toolbarItems {
    objc_setAssociatedObject(self, &toolbarItemsKey, toolbarItems, OBJC_ASSOCIATION_RETAIN);    
}

- (NSArray *)toolbarItems {
    return objc_getAssociatedObject(self, &toolbarItemsKey);
}

@end
