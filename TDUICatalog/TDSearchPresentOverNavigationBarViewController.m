//
//  TDSearchPresentOverNavigationBarViewController.m
//  TDUICatalog
//
//  Created by Danny Ho on 5/1/16.
//  Copyright © 2016 thanksdanny. All rights reserved.
//

#import "TDSearchPresentOverNavigationBarViewController.h"
#import "TDSearchResultsViewController.h"

@interface TDSearchPresentOverNavigationBarViewController ()

@property (nonatomic, strong) UISearchController *searchController;

@end

@implementation TDSearchPresentOverNavigationBarViewController

#pragma mark - View Life Cycle

- (IBAction)searchButtonClicked:(UIBarButtonItem *)sender {
    // Create the search results view controller and use it for the UISearchController.
    TDSearchResultsViewController *searchResultController = [self.storyboard instantiateViewControllerWithIdentifier:TDSearchResultsViewControllerStoryboardIdentifier];
    
    // Create the search controller and make it perform the results updating.
    self.searchController = [[UISearchController alloc] initWithSearchResultsController:searchResultController];
    self.searchController.searchResultsUpdater = searchResultController;
    self.searchController.hidesNavigationBarDuringPresentation = NO;
    
    // Present the view controller.
    [self presentViewController:self.searchController animated:YES completion:nil];
}


@end
