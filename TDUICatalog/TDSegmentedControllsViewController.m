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
    [self configureCustomBackgroundSegmentedControl];
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
    self.customBackgroundSegmentedControl.selectedSegmentIndex = 2;
    
    // Set the background images for each control state
    UIImage *normalSegmentBackgroundImage = [UIImage imageNamed:@"stepper_and_segment_background"];
    [self.customBackgroundSegmentedControl setBackgroundImage:normalSegmentBackgroundImage  forState:UIControlStateNormal barMetrics:UIBarMetricsDefault]; // 最后一个参数
    
    UIImage *disabledSegmentBackgroundImage = [UIImage imageNamed:@"stepper_and_segment_background_disabled"];
    [self.customBackgroundSegmentedControl setBackgroundImage:disabledSegmentBackgroundImage  forState:UIControlStateDisabled barMetrics:UIBarMetricsDefault];
    
    UIImage *highlightedSegmentBackgroundImage = [UIImage imageNamed:@"stepper_and_segment_background_highlighted"];
    [self.customBackgroundSegmentedControl setBackgroundImage:highlightedSegmentBackgroundImage  forState:UIControlStateHighlighted barMetrics:UIBarMetricsDefault];
    
    // Set the divider image.
    UIImage *segmentDividerImage = [UIImage imageNamed:@"stepper_and_segment_segment_divider"];
    [self.customBackgroundSegmentedControl setDividerImage:segmentDividerImage forLeftSegmentState:UIControlStateNormal rightSegmentState:UIControlStateNormal barMetrics:UIBarMetricsDefault];
    
    //Create a font to use for the attributed title (both normal and highlighted states).
    UIFontDescriptor *captionFontDescriptor = [UIFontDescriptor preferredFontDescriptorWithTextStyle:UIFontTextStyleCaption1];
    UIFont *font = [UIFont fontWithDescriptor:captionFontDescriptor size:0]; // size 0???!!
    
    NSDictionary *normalTextAttributes = @{
        NSForegroundColorAttributeName : [UIColor td_applicationPurpleColor],
        NSFontAttributeName : font
        };
    [self.customBackgroundSegmentedControl setTitleTextAttributes:normalTextAttributes forState:UIControlStateNormal];
    
    NSDictionary *highTextAttributes = @{
        NSForegroundColorAttributeName : [UIColor td_applicationGreenColor],
        NSFontAttributeName : font
        };
    [self.customBackgroundSegmentedControl setTitleTextAttributes:highTextAttributes forState:UIControlStateHighlighted];
    [self.customBackgroundSegmentedControl addTarget:self action:@selector(selectedSegmentDidChange:) forControlEvents:UIControlEventValueChanged];
    
}

#pragma mark - Action
- (void)selectedSegmentDidChange:(UISegmentedControl *)segmentedControl {
    NSLog(@"The selected segment changed for:%@.", segmentedControl);
}

@end
