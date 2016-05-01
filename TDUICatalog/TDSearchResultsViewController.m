//
//  TDSearchResultsViewController.m
//  TDUICatalog
//
//  Created by Danny Ho on 5/1/16.
//  Copyright © 2016 thanksdanny. All rights reserved.
//

#import "TDSearchResultsViewController.h"

NSString *const TDSearchResultsViewControllerStoryboardIdentifier = @"TDSearchResultViewControllerStoryboardIdentifier";

@implementation TDSearchResultsViewController

#pragma mark - UISearchResultsUpdating

- (void)updateSearchResultsForSearchController:(UISearchController *)searchController {
    /*
     -updateSearchResultsForSearchController: is called when the controller is
     being dismissed to allow those who are using the controller they are search
     as the results controller a chance to reset their state. No need to update
     anything if we're being dismissed.
     */
    if (!searchController.active) {
        return;
    }
    
    self.filterString = searchController.searchBar.text;
}


@end
