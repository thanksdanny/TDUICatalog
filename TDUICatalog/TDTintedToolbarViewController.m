//
//  TDTintedToolbarViewController.m
//  TDUICatalog
//
//  Created by Danny Ho on 5/1/16.
//  Copyright © 2016 thanksdanny. All rights reserved.
//

#import "TDTintedToolbarViewController.h"
#import "UIColor+TDApplicationSpecific.h"

@interface TDTintedToolbarViewController ()

@property (weak, nonatomic) IBOutlet UIToolbar *toolbar;

@end

#pragma mark -

@implementation TDTintedToolbarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self configureToolbar];
}

#pragma mark - Configuration

- (void)configureToolbar {
    // See the UIBarStyle enum for more styles, including UIBarStyleDefault.
    self.toolbar.barStyle = UIBarStyleBlackTranslucent;
    
    self.toolbar.tintColor = [UIColor td_applicationGreenColor];
    self.toolbar.backgroundColor = [UIColor td_applicationBlueColor];
    
    NSArray *toolbarButtonItems = @[[self refreshBarButtonItem], [self flexibleSpaceBarButtonItem], [self actionBarButtonItem]];
    [self.toolbar setItems:toolbarButtonItems animated:YES];
}

#pragma mark - UIBarButtonItem Creation and Configuration

- (UIBarButtonItem *)refreshBarButtonItem {
    return [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemRefresh target:self action:@selector(barButtonItemClicked:)];
}

- (UIBarButtonItem *)flexibleSpaceBarButtonItem {
    return [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:NULL];
}

- (UIBarButtonItem *)actionBarButtonItem {
    return [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAction target:self action:@selector(barButtonItemClicked:)];
}

#pragma mark - Action

- (void)barButtonItemClicked:(UIBarButtonItem *)barButtonItem {
    NSLog(@"A bar button item on the tinted toolbar was clicked %@.", barButtonItem);
}

@end
