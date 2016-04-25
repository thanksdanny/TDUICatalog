//
//  TDPickerViewController.m
//  TDUICatalog
//
//  Created by Danny Ho on 4/25/16.
//  Copyright © 2016 thanksdanny. All rights reserved.
//

#import "TDPickerViewController.h"

typedef NS_ENUM(NSInteger, TDPickerViewControllerColorComponent) {
    TDColorComponentRed = 0,
    TDColorComponentGreen,
    TDColorComponentBlue,
    TDColorComponentCount
};

// The maximum RGB color
#define TD_RGB_MAX 255.0

/// The offset of each color value (from 0 to 255) for red, green, and blue.
#define TD_COLOR_VALUE_OFFSET 5

// The number of colors within a color component
#define TD_NUMBER_OF_COLOR_VALUES_PRE_COMPONENT ((NSInteger)ceil(TD_RGB_MAX / TD_COLOR_VALUE_OFFSET) + 1)

@interface TDPickerViewController () <UIPickerViewDataSource, UIPickerViewDelegate, UIPickerViewAccessibilityDelegate>

@property (weak, nonatomic) IBOutlet UIPickerView *pickerView;
@property (weak, nonatomic) IBOutlet UIView *colorSwatchView;

@property (nonatomic) CGFloat redColorComponent;
@property (nonatomic) CGFloat greenColorComponent;
@property (nonatomic) CGFloat blueColorComponent;

@end

#pragma mark - 

@implementation TDPickerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Show that a given row is selected. This is off by default.
    self.pickerView.showsSelectionIndicator = YES;
    
    [self configurePickerView];
}

- (void)updateColorSwatchViewBackgroundColor {
    self.colorSwatchView.backgroundColor =[UIColor colorWithRed:self.redColorComponent green:self.greenColorComponent blue:self.blueColorComponent alpha:1];
}

#pragma mark - Configuration

- (void)configurePickerView {
    // Set the default selected rows (the desired rows to initially select will vary by use case).
    [self selectRowInPickerView:13 withColorComponet:TDColorComponentRed];
    [self selectRowInPickerView:41 withColorComponet:TDColorComponentGreen];
    [self selectRowInPickerView:24 withColorComponet:TDColorComponentBlue];
}

- (void)selectRowInPickerView:(NSInteger)row withColorComponet:(TDPickerViewControllerColorComponent)colorComponent {
    // Note that the delegate method on UIPickerViewDelegate is not triggered when manually calling -[UIPickerView selectRow:inComponent:animated:].
    // To do this, we fire off the delegate method manually.
    [self.pickerView selectRow:row inComponent:(NSInteger)colorComponent animated:YES];
    [self pickerView:self.pickerView didSelectRow:row inComponent:(NSInteger)colorComponent];
}

#pragma mark - RGB Color Setter Overrides
- (void)setRedColorComponent:(CGFloat)redColorComponent {
    if (_redColorComponent != redColorComponent) {
        _redColorComponent = redColorComponent;
        
        [self updateColorSwatchViewBackgroundColor];
    }
}

- (void)setGreenColorComponent:(CGFloat)greenColorComponent {
    if (_greenColorComponent != greenColorComponent) {
        _greenColorComponent = greenColorComponent;
        
        [self updateColorSwatchViewBackgroundColor];
    }
}

- (void)setBlueColorComponent:(CGFloat)blueColorComponent {
    if (_blueColorComponent != blueColorComponent) {
        _blueColorComponent = blueColorComponent;
        
        [self updateColorSwatchViewBackgroundColor];
    }
}

#pragma mark - UIPickerViewDataSource

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    return TDColorComponentCount; // 这里有巧妙哦
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    return TD_NUMBER_OF_COLOR_VALUES_PRE_COMPONENT;
}

#pragma mark - UIPickerViewDelegate

- (NSAttributedString *)pickerView:(UIPickerView *)pickerView attributedTitleForRow:(NSInteger)row forComponent:(NSInteger)component {
    NSInteger colorValue = row * TD_COLOR_VALUE_OFFSET;
    
    CGFloat colorComponent = (CGFloat)colorValue / TD_RGB_MAX;
    CGFloat redColorComponent = 0;
    CGFloat greenColorCompoent = 0;
    CGFloat blueColorComponent = 0;
    
    switch (component) {
        case TDColorComponentRed:
            redColorComponent = colorComponent;
            break;
        case TDColorComponentGreen:
            greenColorCompoent = colorComponent;
            break;
        case TDColorComponentBlue:
            blueColorComponent = colorComponent;
            break;
        default:
            NSLog(@"Invalid row/component combination for picker view");
            break;
    }
    
    UIColor *foregroundColor = [UIColor colorWithRed:redColorComponent green:greenColorCompoent blue:blueColorComponent alpha:1];
    NSString *titleText = [NSString stringWithFormat:@"%ld", (long)colorValue];
    
    // Set the foreground color for the attributed string
    NSDictionary *attributes = @{NSForegroundColorAttributeName : foregroundColor};
    
    NSAttributedString *title = [[NSAttributedString alloc] initWithString:titleText attributes:attributes];
    
    return title;
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component {
    CGFloat colorComponentValue = (TD_COLOR_VALUE_OFFSET * row) / TD_RGB_MAX;
    
    switch (component) {
        case TDColorComponentRed:
            self.redColorComponent = colorComponentValue;
            break;
            
        case TDColorComponentGreen:
            self.greenColorComponent = colorComponentValue;
            break;
            
        case TDColorComponentBlue:
            self.blueColorComponent = colorComponentValue;
            break;
            
        default:
            NSLog(@"Invalid row/component combination selected for picker view.");
            break;
    }
}

#pragma mark - UIPickerViewAccessibilityDelegate

- (NSString *)pickerView:(UIPickerView *)pickerView accessibilityLabelForComponent:(NSInteger)component {
    NSString *accessibilityLabel;
    
    switch (component) {
        case TDColorComponentRed:
            accessibilityLabel = NSLocalizedString(@"Red color component value", nil);
            break;
            
        case TDColorComponentGreen:
            accessibilityLabel = NSLocalizedString(@"Green color component value", nil);
            break;
        
        case TDColorComponentBlue:
            accessibilityLabel = NSLocalizedString(@"Blue color component value", nil);
            break;
            
        default:
            NSLog(@"Invalid row/component combination for picker view.");
            break;
    }
    return accessibilityLabel;
}

@end
