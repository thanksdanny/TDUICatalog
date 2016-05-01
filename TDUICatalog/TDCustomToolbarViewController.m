//
//  TDCustomToolbarViewController.m
//  TDUICatalog
//
//  Created by Danny Ho on 5/1/16.
//  Copyright © 2016 thanksdanny. All rights reserved.
//

#import "TDCustomToolbarViewController.h"
#import "UIColor+TDApplicationSpecific.h"

@interface TDCustomToolbarViewController ()

@property (weak, nonatomic) IBOutlet UIToolbar *toolbar;

@end

#pragma mark -

@implementation TDCustomToolbarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self configureToolbar];
}

#pragma mark - Configuration

- (void)configureToolbar {
    UIImage *toolbarBackgroundImage = [UIImage imageNamed:@"toolbar_background"];
    [self.toolbar setBackgroundImage:toolbarBackgroundImage forToolbarPosition:UIBarPositionBottom barMetrics:UIBarMetricsDefault];
    
    NSArray *toolbarButtonItems = @[[self customImageBarButtonItem], [self flexibleSpaceBarButtonItem], [self customBarButtonItem]];
    [self.toolbar setItems:toolbarButtonItems];
}

#pragma mark - UIBarbuttonItem Creation and Configuration

- (UIBarButtonItem *)customImageBarButtonItem {
    UIImage *customBarButtonItemImage = [UIImage imageNamed:@"tools_icon"];
    UIBarButtonItem *customImageBarButtonItem = [[UIBarButtonItem alloc] initWithImage:customBarButtonItemImage style:UIBarButtonItemStylePlain target:self action:@selector(barButtonItemClicked:)];
    customImageBarButtonItem.tintColor = [UIColor td_applicationPurpleColor];
    return customImageBarButtonItem;
}

- (UIBarButtonItem *)flexibleSpaceBarButtonItem {
    return [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:NULL];
}

- (UIBarButtonItem *)customBarButtonItem {
    UIBarButtonItem *barButtonItem = [[UIBarButtonItem alloc] initWithTitle:NSLocalizedString(@"Button", nil) style:UIBarButtonItemStylePlain target:self action:@selector(barButtonItemClicked:)];
    
    NSDictionary *attributes = @{
        NSForegroundColorAttributeName : [UIColor td_applicationPurpleColor]
    };
    [barButtonItem setTitleTextAttributes:attributes forState:UIControlStateNormal];
    
    return barButtonItem;
}

#pragma mark - Actions

- (void)barButtonItemClicked:(UIBarButtonItem *)barButtonItem {
    NSLog(@"A bar button item on the custom toolbar was clicked: %@.", barButtonItem);
}



@end
