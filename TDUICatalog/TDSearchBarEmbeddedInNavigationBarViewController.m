//
//  TDSearchBarEmbeddedInNavigationBarViewController.m
//  TDUICatalog
//
//  Created by Danny Ho on 5/1/16.
//  Copyright © 2016 thanksdanny. All rights reserved.
//

#import "TDSearchBarEmbeddedInNavigationBarViewController.h"
#import "TDSearchResultsViewController.h"

@interface TDSearchBarEmbeddedInNavigationBarViewController ()

@property (nonatomic, strong) UISearchController *searchController;

@end

@implementation TDSearchBarEmbeddedInNavigationBarViewController

#pragma mark - View Life Cycle

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Create the search results view controller and use it for the UISearchController.
    TDSearchResultsViewController *searchResultsController = [self.storyboard instantiateViewControllerWithIdentifier:TDSearchResultsViewControllerStoryboardIdentifier];
    
    // Create the search controller and make it perform the results updating.
    self.searchController = [[UISearchController alloc] initWithSearchResultsController:searchResultsController];
    self.searchController.searchResultsUpdater = searchResultsController;
    self.searchController.hidesNavigationBarDuringPresentation = NO;
    
    /*
     Configure the search controller's search bar. For more information on how to configure
     search bars, see the "Search Bar" group under "Search".
     */
    self.searchController.searchBar.searchBarStyle = UISearchBarStyleMinimal;
    self.searchController.searchBar.placeholder = NSLocalizedString(@"Search", nil);
    
    // Include the search bar within the navigation bar
    self.navigationItem.titleView = self.searchController.searchBar;
    
    self.definesPresentationContext = YES;
    
}


@end
