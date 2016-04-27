//
//  TDSteppersViewController.m
//  TDUICatalog
//
//  Created by Danny Ho on 4/27/16.
//  Copyright © 2016 thanksdanny. All rights reserved.
//

#import "TDSteppersViewController.h"
#import "UIColor+TDApplicationSpecific.h"

@interface TDSteppersViewController ()

@property (weak, nonatomic) IBOutlet UIStepper *defaultStepper;
@property (weak, nonatomic) IBOutlet UIStepper *tintedStepper;
@property (weak, nonatomic) IBOutlet UIStepper *customStepper;

@property (weak, nonatomic) IBOutlet UILabel *defaultSteperLabel;
@property (weak, nonatomic) IBOutlet UILabel *tintedSteperLabel;
@property (weak, nonatomic) IBOutlet UILabel *customSteperLabel;

@end

#pragma mark -

@implementation TDSteppersViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self configureDefaultStepper];
    [self configureTintedStepper];
    [self configureCustomStepper];
}

#pragma mark - Configure

- (void)configureDefaultStepper {
    self.defaultStepper.value = 0;
    self.defaultStepper.minimumValue = 0;
    self.defaultStepper.maximumValue = 10;
    self.defaultStepper.stepValue = 1;
    
    self.defaultSteperLabel.text = [NSString stringWithFormat:@"%ld", (long)self.defaultStepper.value];
    // 疑问，上面这行不是已经改了text么，为啥还要action里的方法去修改
    [self.defaultStepper addTarget:self action:@selector(stepperValueDidChange:) forControlEvents:UIControlEventValueChanged];
}

- (void)configureTintedStepper {
    self.tintedStepper.tintColor = [UIColor td_applicationBlueColor];
    
    self.tintedSteperLabel.text = [NSString stringWithFormat:@"%ld", (long)self.tintedStepper.value];
    [self.tintedStepper addTarget:self action:@selector(stepperValueDidChange:) forControlEvents:UIControlEventValueChanged];
}

- (void)configureCustomStepper {
    // set the background image states.
    UIImage *stepperBackgroundImage = [UIImage imageNamed:@"stepper_and_segment_background"];
    [self.customStepper setBackgroundImage:stepperBackgroundImage forState:UIControlStateNormal];
    
    UIImage *stepperHightlightedBackgroundImage = [UIImage imageNamed:@"stepper_and_segment_background_highlighted"];
    [self.customStepper setBackgroundImage:stepperHightlightedBackgroundImage forState:UIControlStateHighlighted];
    
    UIImage *stepperDisabledBackgroundImage = [UIImage imageNamed:@"stepper_and_segment_background_disabled"];
    [self.customStepper setBackgroundImage:stepperDisabledBackgroundImage forState:UIControlStateDisabled];
    
    // Set the image which will be painted in between the two stepper segments (depends on the states of both segments).
    [self.customStepper setDividerImage:[UIImage imageNamed:@"stepper_and_segment_divider"] forLeftSegmentState:UIControlStateNormal rightSegmentState:UIControlStateNormal];
    
    // Set the image for the + button.
    UIImage *stepperIncrementImage = [UIImage imageNamed:@"stepper_increment"];
    [self.customStepper setIncrementImage:stepperIncrementImage forState:UIControlStateNormal];
    
    // Set the image for the - button.
    UIImage *stepperDecrementImage = [UIImage imageNamed:@"stepper_decrement"];
    [self.customStepper setDecrementImage:stepperDecrementImage forState:UIControlStateNormal];
    
    self.customSteperLabel.text = [NSString stringWithFormat:@"%ld", (long)self.customStepper.value];
    [self.customStepper addTarget:self action:@selector(stepperValueDidChange:) forControlEvents:UIControlEventValueChanged];
}


#pragma mark - Actions

- (void)stepperValueDidChange:(UIStepper *)stepper {
    NSLog(@"A stepper changed its value: %@.", stepper);
    
    // Figure out which stepper was selected and update its associated label.
    UILabel *stepperLabel;
    if (self.defaultStepper == stepper) {
        stepperLabel = self.defaultSteperLabel;
    } else if (self.tintedStepper == stepper) {
        stepperLabel = self.tintedSteperLabel;
    } else if (self.customStepper == stepper) {
        stepperLabel = self.customSteperLabel;
    }
    
    stepperLabel.text = [NSString stringWithFormat:@"%ld", (long)stepper.value];
}

@end
