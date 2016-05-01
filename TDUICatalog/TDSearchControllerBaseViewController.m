//
//  TDSearchControllerBaseViewController.m
//  TDUICatalog
//
//  Created by Danny Ho on 5/1/16.
//  Copyright © 2016 thanksdanny. All rights reserved.
//


//Abstract:
//A table view controller that displays filtered strings (used by other view controllers for simple displaying and filtering of data).

#import "TDSearchControllerBaseViewController.h"

NSString *const TDSearchControllerBaseViewControllerTableViewCellIdentifier = @"searchResultCell";

@interface TDSearchControllerBaseViewController ()

@property (copy) NSArray *allResults;
@property (readwrite, copy) NSArray *visibleResults;

@end

@implementation TDSearchControllerBaseViewController

#pragma mark - View Life Cycle

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.allResults = @[@"Here's", @"to", @"the", @"crazy", @"ones.", @"The", @"misfits.", @"The", @"rebels.", @"The", @"troublemakers.", @"The", @"round", @"pegs", @"in", @"the", @"square", @"holes.", @"The", @"ones", @"who", @"see", @"things", @"differently.", @"They're", @"not", @"fond", @"of", @"rules.", @"And", @"they", @"have", @"no", @"respect", @"for", @"the", @"status", @"quo.", @"You", @"can", @"quote", @"them,", @"disagree", @"with", @"them,", @"glorify", @"or", @"vilify", @"them.", @"About", @"the", @"only", @"thing", @"you", @"can't", @"do", @"is", @"ignore", @"them.", @"Because", @"they", @"change", @"things.", @"They", @"push", @"the", @"human", @"race", @"forward.", @"And", @"while", @"some", @"may", @"see", @"them", @"as", @"the", @"crazy", @"ones,", @"we", @"see", @"genius.", @"Because", @"the", @"people", @"who", @"are", @"crazy", @"enough", @"to", @"think", @"they", @"can", @"change", @"the", @"world,", @"are", @"the", @"ones", @"who", @"do."];
    
    self.visibleResults = self.allResults;
}

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.visibleResults.count;
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    return [tableView dequeueReusableCellWithIdentifier:TDSearchControllerBaseViewControllerTableViewCellIdentifier forIndexPath:indexPath];
}

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath {
    cell.textLabel.text = self.visibleResults[indexPath.row];
}

@end
