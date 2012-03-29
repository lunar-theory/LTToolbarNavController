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
static char *toolbarKey = "LTToolbarNavControllerToolbar";

@interface LTToolbarNavViewController ()
@property(nonatomic,readwrite,retain) NSArray *viewControllers;
@property(nonatomic,readwrite,retain) UIViewController *topViewController;
@end

@implementation LTToolbarNavViewController

@synthesize viewControllers;
@synthesize topViewController;

- (id)initWithRootViewController:(UIViewController *)rootViewController {
    if (self = [super init]) {
        objc_setAssociatedObject(rootViewController, &toolbarNavControllerKey, self, OBJC_ASSOCIATION_RETAIN);
        self.viewControllers = [NSMutableArray arrayWithObject:rootViewController];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    if (self.viewControllers.count > 0) {
        self.topViewController = [self.viewControllers objectAtIndex:0];
        [self.view addSubview:topViewController.view];
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

- (void)setToolbar:(UIToolbar *)toolbar {
    objc_setAssociatedObject(self, &toolbarKey, toolbar, OBJC_ASSOCIATION_RETAIN);    
}

- (UIToolbar *)toolbar {
    return objc_getAssociatedObject(self, &toolbarKey);
}

@end
