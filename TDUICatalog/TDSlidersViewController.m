//
//  TDSlidersViewController.m
//  TDUICatalog
//
//  Created by Danny Ho on 4/27/16.
//  Copyright © 2016 thanksdanny. All rights reserved.
//

#import "TDSlidersViewController.h"
#import "UIColor+TDApplicationSpecific.h"

@interface TDSlidersViewController ()

@property (weak, nonatomic) IBOutlet UISlider *defaultSlider;
@property (weak, nonatomic) IBOutlet UISlider *tintedSlider;
@property (weak, nonatomic) IBOutlet UISlider *customSlider;

@end

#pragma mark -

@implementation TDSlidersViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self configureDefaultSlider];
    [self configureTintedSlider];
    [self configureCustomSlider];
}

#pragma mark - Configuration

- (void)configureDefaultSlider {
    self.defaultSlider.minimumValue = 0;
    self.defaultSlider.maximumValue = 100;
    self.defaultSlider.value = 42;
    self.defaultSlider.continuous = YES;
    
    [self.defaultSlider addTarget:self action:@selector(sliderValueDidChange:) forControlEvents:UIControlEventValueChanged];
}

- (void)configureTintedSlider {
    self.tintedSlider.minimumTrackTintColor = [UIColor td_applicationBlueColor];
    self.tintedSlider.maximumTrackTintColor = [UIColor td_applicationPurpleColor];
    
    [self.tintedSlider addTarget:self action:@selector(sliderValueDidChange:) forControlEvents:UIControlEventValueChanged];
}

- (void)configureCustomSlider {
    UIImage *leftTrackImage = [UIImage imageNamed:@"slider_blue_track"];
    [self.customSlider setMinimumTrackImage:leftTrackImage forState:UIControlStateNormal];
    
    UIImage *rightTrackImage = [UIImage imageNamed:@"slider_green_track"];
    [self.customSlider setMaximumTrackImage:rightTrackImage forState:UIControlStateNormal];
    
    UIImage *thumImage = [UIImage imageNamed:@"slider_thumb"];
    [self.customSlider setThumbImage:thumImage forState:UIControlStateNormal];
    
    self.customSlider.minimumValue = 0;
    self.customSlider.maximumValue = 100;
    self.customSlider.continuous = NO;
    self.customSlider.value = 84;
    
    [self.customSlider addTarget:self action:@selector(sliderValueDidChange:) forControlEvents:UIControlEventValueChanged];
}

#pragma mark - Actions

- (void)sliderValueDidChange:(UISlider *)slider {
    NSLog(@"A slider changed its value:%@", slider);
}
@end
