//
//  TDSearchShowResultsInSourceViewController.m
//  TDUICatalog
//
//  Created by Danny Ho on 5/1/16.
//  Copyright © 2016 thanksdanny. All rights reserved.
//

#import "TDSearchShowResultsInSourceViewController.h"

@interface TDSearchShowResultsInSourceViewController ()

@property (nonatomic, strong) UISearchController *searchContoller;

@end

@implementation TDSearchShowResultsInSourceViewController

#pragma mark - View Life Cycle

- (void)viewDidLoad {
    [super viewDidLoad];
    
    /*
     Create the search controller, but we'll make sure that this AAPLSearchShowResultsInSourceViewController
     performs the results updating.
     */
    self.searchContoller = [[UISearchController alloc] initWithSearchResultsController:nil];
    self.searchContoller.searchResultsUpdater = self;
    self.searchContoller.dimsBackgroundDuringPresentation = NO;
    
    // Make sure the that the search bar is visible within the navigation bar.
    [self.searchContoller.searchBar sizeToFit];
    
    // Include the search controller's search bar within the table's header view.
    self.tableView.tableHeaderView = self.searchContoller.searchBar;
    
    self.definesPresentationContext = YES;
}
@end
