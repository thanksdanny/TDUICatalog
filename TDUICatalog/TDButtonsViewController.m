//
//  TDButtonsViewController.m
//  TDUICatalog
//
//  Created by Danny Ho on 4/24/16.
//  Copyright © 2016 thanksdanny. All rights reserved.
//

#import "TDButtonsViewController.h"
#import "UIColor+TDApplicationSpecific.h"

@interface TDButtonsViewController ()

@property (weak, nonatomic) IBOutlet UIButton *systemTextButton;
@property (weak, nonatomic) IBOutlet UIButton *systemContactAddButton;
@property (weak, nonatomic) IBOutlet UIButton *systemDetailDisclosureButton;
@property (weak, nonatomic) IBOutlet UIButton *imageButton;
@property (weak, nonatomic) IBOutlet UIButton *attributedTextButton;

@end

#pragma mark - 

@implementation TDButtonsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self configureSystemTextButton];
    [self configureSystemContactAddButton];
    [self configureSystemDetailDisclosureButton];
    [self configureImageButton];
    [self configureAttributedTextSystemButton];
}

#pragma mark - Configuration
- (void)configureSystemTextButton {
    [self.systemTextButton setTitle:NSLocalizedString(@"Button", nil) forState:UIControlStateNormal];
    [self.systemTextButton addTarget:self action:@selector(buttonClicked:) forControlEvents:UIControlEventTouchUpInside];
}

- (void)configureSystemContactAddButton {
    self.systemContactAddButton.backgroundColor = [UIColor clearColor];
    [self.systemContactAddButton addTarget:self action:@selector(buttonClicked:) forControlEvents:UIControlEventTouchUpInside];
}

- (void)configureSystemDetailDisclosureButton {
    self.systemDetailDisclosureButton.backgroundColor = [UIColor clearColor];
    [self.systemDetailDisclosureButton addTarget:self action:@selector(buttonClicked:) forControlEvents:UIControlEventTouchUpInside];
}

- (void)configureImageButton {
    // To create this button in code you can use +[UIButton buttonWithType:] with a parameter value of UIButtonTypeCustom.
    
    // Remove the title text.
    [self.imageButton setTitle:@"" forState:UIControlStateNormal];
    self.imageButton.tintColor = [UIColor td_applicationPurpleColor];
    UIImage *imageButtonNormalImage = [UIImage imageNamed:@"x_icon"];
    [self.imageButton setImage:imageButtonNormalImage forState:UIControlStateNormal];
    
    // Add an accessibility label to the image.
    self.imageButton.accessibilityLabel = NSLocalizedString(@"X Button", nil);
    
    [self.imageButton addTarget:self action:@selector(buttonClicked:) forControlEvents:-UIControlEventTouchUpInside];
}

- (void)configureAttributedTextSystemButton {
    // Set the button's title for normal state.
    NSDictionary *normalTitleAttributes = @{
                                            NSForegroundColorAttributeName : [UIColor td_applicationBlueColor],
                                            NSStrikethroughStyleAttributeName : @(NSUnderlineStyleSingle)};
    NSAttributedString *normalAttributedTitle = [[NSAttributedString alloc] initWithString:NSLocalizedString(@"Button", nil) attributes:normalTitleAttributes];
    [self.attributedTextButton setAttributedTitle:normalAttributedTitle forState:UIControlStateNormal];
    
    // Set the button's title for hightlighted state.
    NSDictionary *highlightTitleAttributes = @{
                                               NSForegroundColorAttributeName : [UIColor td_applicationGreenColor],
                                               NSStrikethroughStyleAttributeName : @(NSUnderlineStyleThick)};
    NSAttributedString *highlightedAttributedTitle = [[NSAttributedString alloc] initWithString:NSLocalizedString(@"Button", nil) attributes:highlightTitleAttributes];
    [self.attributedTextButton setAttributedTitle:highlightedAttributedTitle forState:UIControlStateHighlighted];
    [self.attributedTextButton addTarget:self action:@selector(buttonClicked:) forControlEvents:UIControlEventTouchUpInside];
}

#pragma mark - Actions
- (void)buttonClicked:(UIButton *)button {
    NSLog(@"A button was clicked:%@.", button);
}



@end
