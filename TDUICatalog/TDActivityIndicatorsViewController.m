//
//  TDActivityIndicatorsViewController.m
//  TDUICatalog
//
//  Created by Danny Ho on 4/17/16.
//  Copyright © 2016 thanksdanny. All rights reserved.
//

#import "TDActivityIndicatorsViewController.h"
#import "UIColor+TDApplicationSpecific.h"  // 到时研究下怎么编写pch

@interface TDActivityIndicatorsViewController ()

@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *graySyleActiviryIndicatorView;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *tinedActivityIndicatorView;

@end

@implementation TDActivityIndicatorsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self configureGrayActivityIndicatorView];
    [self configureTintedActivityIndicatorView];
}

#pragma mark - Configuration

- (void)configureGrayActivityIndicatorView {
    self.graySyleActiviryIndicatorView.activityIndicatorViewStyle = UIActivityIndicatorViewStyleGray;
    [self.graySyleActiviryIndicatorView startAnimating];
    self.graySyleActiviryIndicatorView.hidesWhenStopped = YES;
}

- (void)configureTintedActivityIndicatorView {
    self.tinedActivityIndicatorView.activityIndicatorViewStyle = UIActivityIndicatorViewStyleGray;
    self.tinedActivityIndicatorView.color = [UIColor td_applicationPurpleColor];
    [self.tinedActivityIndicatorView startAnimating];
}


@end
