//
//  TDSwitchesViewController.m
//  TDUICatalog
//
//  Created by Danny Ho on 4/28/16.
//  Copyright © 2016 thanksdanny. All rights reserved.
//

#import "TDSwitchesViewController.h"
#import "UIColor+TDApplicationSpecific.h"

@interface TDSwitchesViewController ()

@property (weak, nonatomic) IBOutlet UISwitch *defaultSwitch;
@property (weak, nonatomic) IBOutlet UISwitch *tintedSwitch;

@end

#pragma mark -

@implementation TDSwitchesViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self configureDefaultSwitch];
    [self congifureTintedSwitch];
}

#pragma mark - Configuration

- (void)configureDefaultSwitch {
    [self.defaultSwitch setOn:YES animated:YES];
    [self.defaultSwitch addTarget:self action:@selector(swithValueDidChange:) forControlEvents:UIControlEventValueChanged];
}

- (void)congifureTintedSwitch {
    self.tintedSwitch.tintColor = [UIColor td_applicationBlueColor];
    self.tintedSwitch.onTintColor = [UIColor td_applicationGreenColor];
    self.tintedSwitch.thumbTintColor = [UIColor td_applicationPurpleColor];
    
    [self.tintedSwitch addTarget:self action:@selector(swithValueDidChange:) forControlEvents:UIControlEventValueChanged];
}

#pragma mark - Actions

- (void)swithValueDidChange:(UISwitch *)aSwitch {
    NSLog(@"A switch changed its value %@.", aSwitch);
}
@end
