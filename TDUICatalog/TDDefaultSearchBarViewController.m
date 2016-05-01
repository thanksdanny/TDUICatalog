//
//  TDDefaultSearchBarViewController.m
//  TDUICatalog
//
//  Created by Danny Ho on 5/1/16.
//  Copyright © 2016 thanksdanny. All rights reserved.
//

#import "TDDefaultSearchBarViewController.h"

@interface TDDefaultSearchBarViewController () <UISearchBarDelegate>

@property (weak, nonatomic) IBOutlet UISearchBar *searchBar;

@end

#pragma mark -

@implementation TDDefaultSearchBarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self configureSearchBar];
}

#pragma mark - Configuration

- (void)configureSearchBar {
    self.searchBar.showsCancelButton = YES;
    self.searchBar.showsScopeBar = YES;  // 这个是？
    
    self.searchBar.scopeButtonTitles = @[
        NSLocalizedString(@"Scope One", nil),
        NSLocalizedString(@"Scope Two", nil)
    ];
}

#pragma mark - UISearchBarDelegate

- (void)searchBar:(UISearchBar *)searchBar selectedScopeButtonIndexDidChange:(NSInteger)selectedScope {
    NSLog(@"The default search selected scope button index changed to %ld.", (long)selectedScope);
}

- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar {
    NSLog(@"The default search bar keyboard search button was tapped: %@.", searchBar.text);
    
    [searchBar resignFirstResponder];
}

- (void)searchBarCancelButtonClicked:(UISearchBar *)searchBar {
    NSLog(@"The default search bar cancel button was tapped.");
    
    [searchBar resignFirstResponder];
}
@end
