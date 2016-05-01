//
//  TDCustomSearchBarViewController.m
//  TDUICatalog
//
//  Created by Danny Ho on 5/1/16.
//  Copyright © 2016 thanksdanny. All rights reserved.
//

#import "TDCustomSearchBarViewController.h"
#import "UIColor+TDApplicationSpecific.h"

@interface TDCustomSearchBarViewController () <UISearchBarDelegate>

@property (weak, nonatomic) IBOutlet UISearchBar *searchBar;

@end

#pragma mark -

@implementation TDCustomSearchBarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self configureSearchBar];
}

#pragma mark - Configuration

- (void)configureSearchBar {
    self.searchBar.showsCancelButton = YES;
    self.searchBar.showsBookmarkButton = YES;
    
    self.searchBar.tintColor = [UIColor td_applicationPurpleColor];
    
    self.searchBar.backgroundImage = [UIImage imageNamed:@"search_bar_background"];
    
    // Set the bookmark image for both normal and highlighted states.
    UIImage *bookmarkImage = [UIImage imageNamed:@"bookmark_icon"];
    [self.searchBar setImage:bookmarkImage forSearchBarIcon:UISearchBarIconBookmark state:UIControlStateNormal];
    
    UIImage *bookmarkHighlightedImage = [UIImage imageNamed:@"bookmark_icon_highlighted"];
    [self.searchBar setImage:bookmarkHighlightedImage forSearchBarIcon:UISearchBarIconBookmark state:UIControlStateHighlighted];
}

#pragma mark - UISearchBarDelegata

- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar {
    NSLog(@"The custom search bar keyboard search button was tapped: %@.", searchBar.text);

    [searchBar resignFirstResponder];
}

- (void)searchBarCancelButtonClicked:(UISearchBar *)searchBar {
    NSLog(@"The custom search bar cancel button was tapped.");
    
    [searchBar resignFirstResponder];
}

- (void)searchBarBookmarkButtonClicked:(UISearchBar *)searchBar {
    NSLog(@"The custom bookmark button inside the search bar was tapped.");
}

@end
