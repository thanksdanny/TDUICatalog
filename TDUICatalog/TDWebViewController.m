//
//  TDWebViewController.m
//  TDUICatalog
//
//  Created by Danny Ho on 5/1/16.
//  Copyright © 2016 thanksdanny. All rights reserved.
//

#import "TDWebViewController.h"

@interface TDWebViewController () <UIWebViewDelegate, UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UITextField *addressTextField;
@property (weak, nonatomic) IBOutlet UIWebView *webView;

@end

#pragma mark -

@implementation TDWebViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self configureWebView];
    [self loadAddressURL];
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    
    [UIApplication sharedApplication].networkActivityIndicatorVisible = NO; // 这种形式没见过啊！！
}

- (void)loadAddressURL {
    NSURL *requestURL = [NSURL URLWithString:self.addressTextField.text];
    NSURLRequest *request = [NSURLRequest requestWithURL:requestURL];
    [self.webView loadRequest:request];
}

#pragma mark - Congifuration

- (void)configureWebView {
    self.webView.backgroundColor = [UIColor whiteColor];
    self.webView.scalesPageToFit = YES;
    self.webView.dataDetectorTypes = UIDataDetectorTypeAll;
}

#pragma mark - UIWebViewDelegate 

- (void)webViewDidStartLoad:(UIWebView *)webView {
    [UIApplication sharedApplication].networkActivityIndicatorVisible = YES; // 这又是什么鬼..
}

- (void)webViewDidFinishLoad:(UIWebView *)webView {
    [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
}

- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error {
    // Report the error inside the web view
    NSString *localizedErrorMessage = NSLocalizedString(@"An error occured:", nil);
    NSString *errorFormatString = @"<!doctype html><html><body><div style=\"width: 100%%; text-align: center; font-size: 36pt;\">%@%@</div></body></html>";
    
    NSString *errorHTML = [NSString stringWithFormat:errorFormatString, localizedErrorMessage, error.localizedDescription]; // 这种报错方式也是第一次见..
    [self.webView loadHTMLString:errorHTML baseURL:nil];
    
    [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
}

#pragma mark - UITextFieldDelegate

// This helps dismiss the keyboard when the "Done" button is clicked.
- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    
    [self loadAddressURL];
    
    return YES;
}

@end
