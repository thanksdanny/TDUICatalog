//
//  TDSearchResultsViewController.h
//  TDUICatalog
//
//  Created by Danny Ho on 5/1/16.
//  Copyright © 2016 thanksdanny. All rights reserved.
//

#import "TDSearchControllerBaseViewController.h"

/// The identifier string that corresponds to the AAPLSearchResultsViewController's view controller defined in the main storyboard.
extern NSString *const TDSearchResultsViewControllerStoryboardIdentifier;

@interface TDSearchResultsViewController : TDSearchControllerBaseViewController <UISearchResultsUpdating>

@end
