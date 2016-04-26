//
//  TDSegmentedControllsViewController.m
//  TDUICatalog
//
//  Created by Danny Ho on 4/26/16.
//  Copyright © 2016 thanksdanny. All rights reserved.
//

#import "TDSegmentedControllsViewController.h"
#import "UIColor+TDApplicationSpecific.h"

@interface TDSegmentedControllsViewController ()

@property (weak, nonatomic) IBOutlet UISegmentedControl *defaultSegmentedControl;
@property (weak, nonatomic) IBOutlet UISegmentedControl *tintedSegmentedControl;
@property (weak, nonatomic) IBOutlet UISegmentedControl *customSegmentedControl;
@property (weak, nonatomic) IBOutlet UISegmentedControl *customBackgroundSegmentedControl;

@end

#pragma mark -

@implementation TDSegmentedControllsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self configureDefaultSegmentedControl];
    [self configureTintedSegmentedControl];
    [self configureCustomSegmentedControl];
}

#pragma mark - Configuration

- (void)configureDefaultSegmentedControl {
    self.defaultSegmentedControl.momentary = YES; // 这个状态是...
    [self.defaultSegmentedControl setEnabled:NO forSegmentAtIndex:0];
    [self.defaultSegmentedControl addTarget:self action:@selector(selectedSegmentDidChange:) forControlEvents:UIControlEventValueChanged];
}

- (void)configureTintedSegmentedControl {
    self.tintedSegmentedControl.tintColor = [UIColor td_applicationBlueColor];
    self.tintedSegmentedControl.selectedSegmentIndex = 1;
    [self.tintedSegmentedControl addTarget:self action:@selector(selectedSegmentDidChange:) forControlEvents:UIControlEventValueChanged];
}

// 第三个图标为啥出不来...
- (void)configureCustomSegmentedControl {
    NSDictionary *imageToAccessibilityLabelMappings = @{
        @"checkmark_icon" : NSLocalizedString(@"Done", nil),
        @"search_icon" : NSLocalizedString(@"search", nil),
        @"tools_icon" : NSLocalizedString(@"Settings", nil)
    };
    
    // Guarantee that the segments show up in the same order.
    NSArray *sortedSegmentImageNames = [[imageToAccessibilityLabelMappings allKeys] sortedArrayUsingSelector:@selector(localizedCaseInsensitiveCompare:)]; // selector里的方法什么鬼
    [sortedSegmentImageNames enumerateObjectsUsingBlock:^(NSString *segmentImageName, NSUInteger idx, BOOL * _Nonnull stop) {
        UIImage *image = [UIImage imageNamed:segmentImageName];
        image.accessibilityLabel = imageToAccessibilityLabelMappings[segmentImageName]; // 这句也不理解
        [self.customSegmentedControl setImage:image forSegmentAtIndex:idx];
    }];
    
    self.customSegmentedControl.selectedSegmentIndex = 0;
    [self.customSegmentedControl addTarget:self action:@selector(selectedSegmentDidChange:)  forControlEvents:UIControlEventValueChanged];
}

- (void)configureCustomBackgroundSegmentedControl {
    
}

#pragma mark - Action
- (void)selectedSegmentDidChange:(UISegmentedControl *)segmentedControl {
    NSLog(@"The selected segment changed for:%@.", segmentedControl);
}

@end
