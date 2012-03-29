//
//  LTToolbarNavViewController.h
//  ToolbarNav
//
//  Created by David Wheeler on 3/28/12.
//  Copyright (c) 2012 iovation. All rights reserved.
//

#import <UIKit/UIKit.h>

@class UIView, UIToolbar;
@protocol LTToolbarNavViewControllerDelegate;

@interface LTToolbarNavViewController : UIViewController

// The current view controller stack.
@property(nonatomic,readonly,retain) NSArray *viewControllers;

// The top view controller on the stack.
@property(nonatomic,readonly,retain) UIViewController *topViewController;

// Convenience method pushes the root view controller without animation.
- (id)initWithRootViewController:(UIViewController *)rootViewController; 

//// Uses a flip transition. Has no effect if the view controller is already in the stack.
//- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated; 
//
//// Returns the popped controller.
//- (UIViewController *)popViewControllerAnimated:(BOOL)animated;
//
//// Pops view controllers until the one specified is on top. Returns the popped controllers.
//- (NSArray *)popToViewController:(UIViewController *)viewController animated:(BOOL)animated;
//
//// Pops until there's only a single view controller left on the stack. Returns the popped controllers.
//- (NSArray *)popToRootViewControllerAnimated:(BOOL)animated;
//
//// Return modal view controller if it exists. Otherwise the top view controller.
//@property(nonatomic,readonly,retain) UIViewController *visibleViewController;
//
//// If animated is YES, then simulate a push or pop depending on whether the
//// new top view controller was previously in the stack.
//- (void)setViewControllers:(NSArray *)viewControllers animated:(BOOL)animated; 
//
//@property(nonatomic,getter=isNavigationBarHidden) BOOL navigationBarHidden;
//
//// Hide or show the navigation bar. If animated, it will transition vertically
//// using UINavigationControllerHideShowBarDuration.
//- (void)setNavigationBarHidden:(BOOL)hidden animated:(BOOL)animated; 
//
//// The navigation bar managed by the controller. Pushing, popping or setting navigation items on a managed navigation bar is not supported.
//@property(nonatomic,readonly) UINavigationBar *navigationBar;
//
//// Defaults to YES, i.e. hidden.
//@property(nonatomic,getter=isToolbarHidden) BOOL toolbarHidden;
//
//// Hide or show the toolbar at the bottom of the screen. If animated, it will
//// transition vertically using UINavigationControllerHideShowBarDuration.
//- (void)setToolbarHidden:(BOOL)hidden animated:(BOOL)animated;
//
//// For use when presenting an action sheet.
//@property(nonatomic,readonly) UIToolbar *toolbar;
//
//@property(nonatomic, assign) id<LTToolbarNavViewControllerDelegate> delegate;

@end

@interface UIViewController (LTToolbarNavViewControllerItem)

// Created on-demand so that a view controller may customize its navigation appearance.
//@property(nonatomic,readonly,retain) UINavigationItem *toolbarNavItem;

// If YES, then when this view controller is pushed into a controller hierarchy
// with a bottom bar (like a tab bar), the bottom bar will slide out. Default is NO.
//@property(nonatomic) BOOL hidesBottomBarWhenPushed;

// We want a toolbar where we can get it.
@property(nonatomic,retain) IBOutlet UIToolbar *toolbar;

// If this view controller has been pushed onto a navigation controller, return it.
@property(nonatomic,readonly,retain) LTToolbarNavViewController *toolbarNavController;

@end
