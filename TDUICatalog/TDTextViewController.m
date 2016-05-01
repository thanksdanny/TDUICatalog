//
//  TDTextViewController.m
//  TDUICatalog
//
//  Created by Danny Ho on 5/1/16.
//  Copyright © 2016 thanksdanny. All rights reserved.
//

#import "TDTextViewController.h"
#import "UIColor+TDApplicationSpecific.h"

@interface TDTextViewController ()

@property (weak, nonatomic) IBOutlet UITextView *textView;

// Used to adjust the text view's height when the keyboard hides and shows.
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *textViewBottomLayoutGuideConstraint;

@end

#pragma mark - 

@implementation TDTextViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self configureTextView];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    // Listen for changes to keyboard visibility so that we can adjust the text view accordingly.
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(handleKeyboardNotification:) name:UIKeyboardWillShowNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(handleKeyboardNotification:) name:UIKeyboardWillHideNotification object:nil];
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewDidDisappear:animated];
    
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UIKeyboardWillShowNotification object:nil];
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UIKeyboardWillHideNotification object:nil];
}

#pragma mark - Keyboard Event Notification

- (void)handleKeyboardNotification:(NSNotification *)notification {
    NSDictionary *userInfo = notification.userInfo;
    
    // Get information about the animation.
    NSTimeInterval animationDuration = [userInfo[UIKeyboardFrameBeginUserInfoKey] doubleValue];
    UIViewAnimationOptions animationCurve = [userInfo[UIKeyboardAnimationCurveUserInfoKey] integerValue];
    
    // Convert the keyboard frame from screen to view coordinates.
    CGRect keyboardScreenBeginFrame = [userInfo[UIKeyboardFrameBeginUserInfoKey] CGRectValue];
    CGRect keyboardScreenEndFrame = [userInfo[UIKeyboardFrameEndUserInfoKey] CGRectValue];
    
    CGRect keyboardViewBeginFrame = [self.view convertRect:keyboardScreenBeginFrame fromView:self.view.window];
    CGRect keyboardViewEndFrame = [self.view convertRect:keyboardScreenEndFrame fromView:self.view.window];
    CGFloat originDelta = keyboardViewEndFrame.origin.y - keyboardViewBeginFrame.origin.y;
    
    // The text view should be adjusted, upadate the constant for this constraint.
    self.textViewBottomLayoutGuideConstraint.constant -= originDelta;
    
    // Inform the view that its autolayout constraints have changed and the layout should be updated.
    [self.view setNeedsUpdateConstraints];
    
    // Animate updating the view's layout by calling `layoutIfNeeded` inside a `UIView` animation block.
    UIViewAnimationOptions animationOptions = animationCurve | UIViewAnimationOptionBeginFromCurrentState;
    [UIView animateWithDuration:animationDuration delay:0 options:animationOptions animations:^{
        [self.view layoutIfNeeded];
    } completion:nil];
    
    // Scroll to the selected text once the keyboard frame changes.
    NSRange selectedRange = self.textView.selectedRange;
    [self.textView scrollRangeToVisible:selectedRange];
}

#pragma mark - Configuration

- (void)configureTextView {
    UIFontDescriptor *bodyFontDescriptor = [UIFontDescriptor preferredFontDescriptorWithTextStyle:UIFontTextStyleBody];
    self.textView.font = [UIFont fontWithDescriptor:bodyFontDescriptor size:0];
    
    self.textView.textColor = [UIColor blackColor];
    self.textView.backgroundColor = [UIColor whiteColor];
    self.textView.scrollEnabled = YES;
    
    /*
     Let's modify some of the attributes of the attributed string.
     You can modify these attributes yourself to get a better feel for what they do.
     Note that the initial text is visible in the storyboard.
     */
    NSMutableAttributedString *attributedText = [[NSMutableAttributedString alloc] initWithAttributedString:self.textView.attributedText];
    
    NSString *text = self.textView.text;
    
    // Find the range of each element to modify.
    NSRange boldRange = [text rangeOfString:NSLocalizedString(@"blod", nil)];
    NSRange highlightRange = [text rangeOfString:NSLocalizedString(@"highlighted", nil)];
    NSRange underlineRange = [text rangeOfString:NSLocalizedString(@"underlined", nil)];
    NSRange tintedRange = [text rangeOfString:NSLocalizedString(@"tinted", nil)];
    
    // Add bold.
    UIFontDescriptor *boldFontDescriptor = [self.textView.font.fontDescriptor fontDescriptorWithSymbolicTraits:UIFontDescriptorTraitBold]; // fontDescriptorWithSymbolicTraits 符号特征的字体描述符
    UIFont *boldFont = [UIFont fontWithDescriptor:boldFontDescriptor size:0];
    [attributedText addAttribute:NSFontAttributeName value:boldFont range:boldRange];
    
    // Add hightlight
    [attributedText addAttribute:NSBackgroundColorAttributeName value:[UIColor td_applicationGreenColor] range:highlightRange];
    
    // Add underline.
    [attributedText addAttribute:NSUnderlineStyleAttributeName value:@(NSUnderlineStyleSingle) range:underlineRange];
    
    // Add tint.
    [attributedText addAttribute:NSForegroundColorAttributeName value:[UIColor td_applicationBlueColor] range:tintedRange];
    
    // Add an image attachment.
    NSTextAttachment *textAttachment = [[NSTextAttachment alloc] init];
    UIImage *image = [UIImage imageNamed:@"text_view_attachment"];
    textAttachment.image = image;
    textAttachment.bounds = CGRectMake(0, 0, image.size.width, image.size.height);
    
    NSAttributedString *textAttachmentString = [NSAttributedString attributedStringWithAttachment:textAttachment];
    [attributedText appendAttributedString:textAttachmentString];
    
    self.textView.attributedText = attributedText;
}

#pragma mark - UITextViewDelegate

- (void)textViewDidBeginEditing:(UITextView *)textView {
    // Provide a "Done" button for the user to select to signify completion with writing text in the text view.
    UIBarButtonItem *doneBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(doneBarButtonItemClicked)];
    
    [self.navigationItem setRightBarButtonItem:doneBarButtonItem animated:YES];
}

#pragma mark - Actions

- (void)doneBarButtonItemClicked {
    // Dismiss the keyboard by removing it as the first responder.
    [self.textView resignFirstResponder];
    
    [self.navigationItem setRightBarButtonItem:nil animated:YES];
}

@end
