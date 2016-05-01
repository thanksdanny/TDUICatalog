//
//  TDDefaultToolbarViewController.m
//  TDUICatalog
//
//  Created by Danny Ho on 5/1/16.
//  Copyright © 2016 thanksdanny. All rights reserved.
//

#import "TDDefaultToolbarViewController.h"

@interface TDDefaultToolbarViewController ()

@property (weak, nonatomic) IBOutlet UIToolbar *toobarl;

@end

#pragma mark -

@implementation TDDefaultToolbarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self configureToolbar];
}

#pragma mark - Configuration 

- (void)configureToolbar {
    NSArray *toolbarButtonItems = @[[self trashBarButtonItem], [self flexibleSpaceBarButtonItem], [self customTitleBarButtonItem]];
    [self.toobarl setItems:toolbarButtonItems animated:YES];
}

#pragma mark - UIBarButtonItem Creation and Configuration

- (UIBarButtonItem *)trashBarButtonItem {
    return [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemTrash target:self action:@selector(barButtonItemClicked:)];
}

- (UIBarButtonItem *)flexibleSpaceBarButtonItem { // 这个貌似是撑开两个按钮位置的那条东西
    return [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:NULL];
}

- (UIBarButtonItem *)customTitleBarButtonItem {
    NSString *customTitle = NSLocalizedString(@"Action", nil);
    
    return [[UIBarButtonItem alloc] initWithTitle:customTitle style:UIBarButtonItemStylePlain target:self action:@selector(barButtonItemClicked:)];
}

#pragma mark - Actions

- (void)barButtonItemClicked:(UIBarButtonItem *)barButtonItem {
    NSLog(@"A bar button item on the default toolbar was clicked: %@.", barButtonItem);
}

@end
