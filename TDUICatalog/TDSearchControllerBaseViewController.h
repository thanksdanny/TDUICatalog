//
//  TDSearchControllerBaseViewController.h
//  TDUICatalog
//
//  Created by Danny Ho on 5/1/16.
//  Copyright © 2016 thanksdanny. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TDSearchControllerBaseViewController : UITableViewController

/// A nil / empty filter string means show all results. Otherwise, show
/// only results containing the filter.
@property (nonatomic, copy) NSString *filterString;

@property (readonly, copy) NSArray *visibleResults;

@end
